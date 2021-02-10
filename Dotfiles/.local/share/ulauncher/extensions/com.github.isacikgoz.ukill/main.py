import os
import logging
import gi
import getpass
import subprocess

gi.require_version('Gtk', '3.0')
gi.require_version('Notify', '0.7')

from locale import atof, setlocale, LC_NUMERIC
from gi.repository import Notify
from itertools import islice
from subprocess import Popen, PIPE, check_call, call, CalledProcessError
from ulauncher.api.client.Extension import Extension
from ulauncher.api.client.EventListener import EventListener
from ulauncher.api.shared.event import KeywordQueryEvent, ItemEnterEvent
from ulauncher.api.shared.item.ExtensionResultItem import ExtensionResultItem
from ulauncher.api.shared.item.ExtensionSmallResultItem import ExtensionSmallResultItem
from ulauncher.api.shared.action.RenderResultListAction import RenderResultListAction
from ulauncher.api.shared.action.ExtensionCustomAction import ExtensionCustomAction


logger = logging.getLogger(__name__)
ext_icon = 'images/icon.png'
exec_icon = 'images/executable.png'
dead_icon = 'images/dead.png'


class ProcessKillerExtension(Extension):

    def __init__(self):
        super(ProcessKillerExtension, self).__init__()
        self.subscribe(KeywordQueryEvent, KeywordQueryEventListener())
        self.subscribe(ItemEnterEvent, ItemEnterEventListener())
        setlocale(LC_NUMERIC, '')  # set to OS default locale;

    def show_notification(self, title, text=None, icon=ext_icon):
        logger.debug('Show notification: %s' % text)
        icon_full_path = os.path.join(os.path.dirname(__file__), icon)
        Notify.init("KillerExtension")
        Notify.Notification.new(title, text, icon_full_path).show()


class KeywordQueryEventListener(EventListener):

    def on_event(self, event, extension):
        return RenderResultListAction(list(islice(self.generate_results(event), 10)))

    def generate_results(self, event):
        for (pid, cmd, path, arg) in get_process_list():
            name = ('%s' % (cmd))
            description = ('PID: %s\t command: %s ' % (pid, path))
            if len(arg) > 0:
            	description += '\nargs: %s' % arg
            on_enter = {'alt_enter': False, 'pid': pid, 'cmd': cmd}
            on_enter['keyword'] = event.get_keyword()
            on_enter['argument'] = event.get_argument()
            on_alt_enter = on_enter.copy()
            on_alt_enter['alt_enter'] = True
            if event.get_argument():
                if event.get_argument() in cmd or event.get_argument() == pid:
                    yield ExtensionResultItem(icon=exec_icon,
                                                   name=name,
                                                   description=description,
                                                   on_enter=ExtensionCustomAction(on_enter),
                                                   on_alt_enter=ExtensionCustomAction(on_alt_enter, keep_app_open=True))
            else:
                yield ExtensionResultItem(icon=exec_icon,
                                               name=name,
                                               description=description,
                                               on_enter=ExtensionCustomAction(on_enter),
                                               on_alt_enter=ExtensionCustomAction(on_alt_enter, keep_app_open=True))


class ItemEnterEventListener(EventListener):

    def kill(self, extension, pid, signal):
        cmd = ['kill', '-s', signal, pid]
        logger.info(' '.join(cmd))

        try:
            check_call(cmd) == 0
            extension.show_notification("Done", "It's dead now", icon=dead_icon)
        except CalledProcessError as e:
            extension.show_notification("Error", "'kill' returned code %s" % e.returncode)
        except Exception as e:
            logger.error('%s: %s' % (type(e).__name__, e.args[0]))
            extension.show_notification("Error", "Check the logs")
            raise

    def killall(self, extension, keyword):
        cmd = ['killall', keyword]
        logger.info(' '.join(cmd))

        try:
            check_call(cmd) == 0
            extension.show_notification("Done", "It's dead now", icon=dead_icon)
        except CalledProcessError as e:
            extension.show_notification("Error", "'kill' returned code %s" % e.returncode)
        except Exception as e:
            logger.error('%s: %s' % (type(e).__name__, e.args[0]))
            extension.show_notification("Error", "Check the logs")
            raise

    def show_signal_options(self, data):
        result_items = []
        options = [('TERM', '15 TERM (default)'), ('KILL', '9 KILL'), ('HUP', '1 HUP')]
        for sig, name in options:
            on_enter = data.copy()
            on_enter['alt_enter'] = False
            on_enter['signal'] = sig
            result_items.append(ExtensionResultItem(icon=ext_icon,
                                                         name=name,
                                                         description='',
                                                         highlightable=False,
                                                         on_enter=ExtensionCustomAction(on_enter)))
        return RenderResultListAction(result_items)

    def on_event(self, event, extension):
        data = event.get_data()
        if data['alt_enter']:
            return self.show_signal_options(data)
        else:
            if data['keyword'] == 'killall':
                self.killall(extension, data['argument'])
            if data['keyword'] == 'kill':
                self.kill(extension, data['pid'], data.get('signal', 'TERM'))


def get_process_list():
    user = getpass.getuser()
    pids_with_short_name = subprocess.Popen(['ps', '-U', user], stdout=subprocess.PIPE).communicate()[0].decode('utf8').split('\n')
    pids_with_path_and_args = subprocess.Popen(['ps', '-U', user, '-f'], stdout=subprocess.PIPE).communicate()[0].decode('utf8').split('\n')

    for idx, line in enumerate(pids_with_short_name):
        col = line.split()
        kol = pids_with_path_and_args[idx].split()
        try:
            int(col[0])
        except (ValueError, IndexError):
            # not a number
            continue
        
        pid = col[0]
        cmd = col[3]
        path = kol[7]
        try:
            arg = kol[8]
        except (ValueError, IndexError):
            arg = ''
        yield (pid, cmd, path, arg)


if __name__ == '__main__':
    ProcessKillerExtension().run()
