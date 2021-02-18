#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

# Autostart
export PATH=$PATH:$HOME/Scripts/Shell/Autostart/

pgrep -x firewall-applet && killall firewall-applet
pgrep -x nm-applet && killall nm-applet
pgrep -x cairo-dock && killall cairo-dock
pgrep -x easystroke && killall easystroke

# nvidia_led.sh &

# nvidia-settings --load-config-only &

picom -cCGb &

setxkbmap -layout es &

set_background.sh &

firewall-applet &

nm-applet --sm-disable &

cairo-dock &

easystroke &

imwheel.sh &

exec qtile
