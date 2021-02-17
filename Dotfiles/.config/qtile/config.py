# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen, Match
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import base
import subprocess
import os

mod = "mod4"
terminal = guess_terminal()


# ================================= SHORTCUTS =================================  #
keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    Key([mod, "control"], "j", lazy.layout.shuffle_up()),

    # Shrink Window
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease(),
        lazy.layout.add()),

    # Grow Window
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),

    # Kill Window
    Key([mod], "w", lazy.window.kill()),

    # Terminal
    Key([mod], "t", lazy.spawn(terminal)),

    # Run Command
    Key([mod], "r", lazy.spawncmd()),

    # Restart Shutdown
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

]


# ================================= GROUPS =================================  #
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


# Run "sleep 5 && xprop" to see the wm class and name of an X client.
groups = [Group("1", label="", layout='max', matches=[Match(wm_class=["firefox", "lutris"])]),
          Group("2", label="", layout='monadtall', matches=[Match(wm_class=["jetbrains-pycharm-ce-debug"])]),
          Group("3", label="", layout='monadtall'),
          Group("4", label="", layout='monadtall'),
          Group("5", label="", layout='monadtall'),
          Group("6", label="", layout='monadtall'),
          Group("7", label="", layout='monadtall'),
          Group("8", label="", layout='floating')]

# Switch Groups
for i in groups:
    keys.extend([
        # Switch to group (mod + number of group)
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # Next group, Previous group
        Key([mod], "n", lazy.screen.next_group()),
        Key([mod], "p", lazy.screen.prev_group()),

        # Switch to & Move focused window to group (mod + shift + number of group)
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),

        # Move focused window to group (mod + shift + letter of group)
        # Key([mod, "shift"], i.name, lazy.window".format(i.name)),w.togroup(i.name),
        #   desc="move focused window to group {}".format(i.name)),
    ])


# ================================= LAYOUTS =================================  #
layout_theme = {'border_width': 3,
                'margin': 11,
                'border_focus': '#86ACE0',
                'border_normal': '#305673',
                'single_border_width': 0}

layouts = [
    layout.Max(),
    layout.MonadTall(**layout_theme),
    layout.Floating(layout_theme, border_width=0)
    # layout.Bsp(),
    # layout.Stack(num_stacks=2),
    # layout.Columns(),layout_theme
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


# ================================= WIDGETS =================================  #
widget_defaults = dict(
                background='#21242B',
                foreground='#dfdfdf',
                font='Source Code Pro',
                fontsize=15,
                margin=7,
                padding=3)

extension_defaults = widget_defaults.copy()


def updates_pacman_icon():
    p = subprocess.getoutput('pacman -Qu | wc -l | cut -c1-1')
    p = int(p)
    if p > 0:
        return widget.Image(filename='~/.config/qtile/@resources/updates_pacman.png', mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('alacritty sudo pacman -Syu')})
    return widget.Image(filename='~/.config/qtile/@resources/updates_0.png')


def updates_aur_icon():
    a = subprocess.getoutput('paru -Qua | wc -l | cut -c1-1')
    a = int(a)
    if a > 0:
        return widget.Image(filename='~/.config/qtile/@resources/updates_aur.png', mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('alacritty paru -Syua --skipreview')})
    return widget.Image(filename='~/.config/qtile/@resources/updates_0.png')


def cpu_icon():
    cpu_temp = subprocess.getoutput('~/.config/qtile/scripts/cpu_temp.sh | cut -c1-2')
    cpu_temp = int(cpu_temp)
    if cpu_temp <= 50:
        return str('0')
    return str('🔥')


def gpu_icon():
    gpu_temp = subprocess.getoutput('nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits')
    gpu_temp = int(gpu_temp)
    if gpu_temp <= 50:
        return str('1')
    return str('🔥')


def mb_icon():
    mb_temp = subprocess.getoutput('cat "/sys/devices/platform/it87.2608/hwmon/hwmon2/temp1_input" | cut -c -2')
    mb_temp = int(mb_temp)
    if mb_temp <= 30:
        return str('3')
    return str('🔥')


screens = [
    Screen(
        top=bar.Bar(
            [
                # ================================= WIDGETS TOP LEFT =================================  #
                widget.Image(filename='~/.config/qtile/@resources/archlinux.png',
                             margin=0,
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('ulauncher')}),

                widget.CurrentLayoutIcon(scale=0.7),

                widget.GroupBox(font='FontAw4esome',
                                disable_drag=True,
                                highlight_method='text',
                                this_current_screen_border='#86ACE0',
                                borderwidth=0,
                                active='#DFDFDF',
                                inactive='#717171'),

                widget.Prompt(),

                widget.TaskList(borderwidth=2, border='#5C718E', fontsize=14, max_title_width=300),


                # ================================= WIDGETS TOP RIGHT =================================  #
                widget.Systray(padding=10),

                widget.Image(filename='~/.config/qtile/@resources/sound-preferences.svg',
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('pavucontrol')}),

                widget.Image(filename='~/.config/qtile/@resources/nvidia.png',
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('nvidia-settings')}),

                widget.Clock(fontsize=18),

            ],
            34),


        bottom=bar.Bar(
            [
                # ================================= WIDGETS BOTTOM LEFT =================================  #
                widget.Image(filename='~/.config/qtile/@resources/power.png',
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('kill -9 -1')}),

                widget.Spacer(length=10),

                widget.TextBox(font='GoVi_Icons', text='2',
                               mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('spacefm  /')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('df -h / --o=avail | awk "NR>1" | tr -d " "'),
                                   update_interval=1),

                widget.Spacer(length=10),

                widget.TextBox(font='GoVi_Icons', text='H',
                               mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('spacefm  ~/')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('df -h /home --o=avail | awk "NR>1" | tr -d " "'),
                                   update_interval=1),

                widget.Spacer(length=10),

                widget.TextBox(text='/D:',
                               mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('spacefm  /Datos')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('df -h /Datos --o=avail | awk "NR>1" | tr -d " "'),
                                   update_interval=1),

                widget.Spacer(length=10),

                widget.TextBox(text='/M:',
                               mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('spacefm  /Media')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('df -h /Media --o=avail | awk "NR>1" | tr -d " "'),
                                   update_interval=1),

                widget.Spacer(length=20),

                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/notifications.sh'),
                                   font='Noto Color Emoji', update_interval=1,
                                   mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('sh -c ~/.config/qtile/scripts/notf_switch.sh')}),

                widget.Spacer(length=10),

                widget.Image(filename='~/.config/qtile/@resources/gmail.svg', margin=8,
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('firefox "http://www.gmail.com"')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/email.sh'),
                                   update_interval=300, fontsize=12),

                widget.Image(filename='~/.config/qtile/@resources/youtube.svg', margin=8,
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('sh -c ~/.config/qtile/scripts/rss_youtube_Reset.sh')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/rss_youtube_not.sh'),
                                   update_interval=300, fontsize=12),

                widget.Image(filename='~/.config/qtile/@resources/gamepad.png', margin=7,
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('sh -c ~/.config/qtile/scripts/rss_games_Reset.sh')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/rss_games_not.sh'),
                                   update_interval=300, fontsize=12),

                widget.Image(filename='~/.config/qtile/@resources/github.svg', margin=9,
                             mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('sh -c ~/.config/qtile/scripts/rss_github_Reset.sh')}),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/rss_github_not.sh'),
                                   update_interval=300, fontsize=12),

                # updates_pacman_icon(),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/updates_pacman.sh'),
                                   update_interval=1800),

                widget.Spacer(length=10),

                # updates_aur_icon(),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/updates_aur.sh'),
                                   update_interval=1800),


                # ================================= WIDGETS BOTTOM RIGHT ================================= #
                widget.Spacer(length=bar.STRETCH),

                widget.Net(format='{down}/s', interface='enp3s0'),
                widget.Spacer(length=10),
                widget.Image(filename='~/.config/qtile/@resources/arrow_up_down.png'),
                widget.Net(format='{up}/s ', interface='enp3s0'),

                widget.TextBox(font='GoVi_Icons', text='4'),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/mem_load.sh'),
                                   mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('alacritty -e htop')},
                                   update_interval=1),

                widget.Spacer(length=10),

                widget.TextBox(font='GoVi_Icons', text='5'),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/cpu_load.sh'),
                                   mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn('alacritty -e htop')},
                                   update_interval=1),

                widget.Spacer(length=10),

                widget.GenPollText(font='GoVi_Icons', func=lambda: cpu_icon(),
                                   update_interval=1),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/cpu_temp.sh'),
                                   update_interval=1, foreground='#287BDE'),

                widget.TextBox(font='GoVi_Icons', text='1'),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/gpu_temp.sh'),
                                   update_interval=1, foreground='#27AE60'),

                widget.TextBox(font='GoVi_Icons', text='3'),
                widget.GenPollText(func=lambda: subprocess.getoutput('~/.config/qtile/scripts/mb_temp.sh'),
                                   update_interval=1, foreground='#F6FA93'),

                widget.Volume(update_interval=0.2, emoji=True),
                widget.Volume(update_interval=0.2),

                widget.Image(filename='~/.config/qtile/@resources/calendar.png'),
                widget.Clock(format='%a %d/%m/%Y '),
            ],
            34),

    ),
]


# ================================= FLOATING LAYOUTS =================================  #
mouse = [
    Drag([mod], 'Button1', lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], 'Button3', lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], 'Button2', lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `sleep 5 && xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'ulauncher'},
    {'wmclass': 'onboard'},
    {'wmclass': 'Transmission-gtk'},
    {'wmclass': 'file-roller'},
])


auto_fullscreen = True
focus_on_window_activation = "focus"

wmname = "LG3D"

autostart = [
        "killall nm-applet & sleep 2 && nm-applet --sm-disable &",
]

for x in autostart:
    os.system(x)
