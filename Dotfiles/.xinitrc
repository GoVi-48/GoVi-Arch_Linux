#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --output VGA-1-1 --mode 1366x768 --right-of HDMI-0

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

# qt5 Theme
export QT_QPA_PLATFORMTHEME=gtk2 # same as gtk2
# export QT_QPA_PLATFORMTHEME=qt5ct # configure separately

# Suspend if inactivity
pidof -s xautolock >& /dev/null
if [ $? -ne 0 ]; then
  xautolock -time 60 -locker "systemctl suspend" &
fi

# Autostart
export PATH=$PATH:$HOME/Scripts/Shell/Autostart/

pgrep -x yad && killall yad
pgrep -x firewall-applet && killall firewall-applet
pgrep -x nm-applet && killall nm-applet
pgrep -x cairo-dock && killall cairo-dock
pgrep -x easystroke && killall easystroke

#nvidia-settings --load-config-only &

picom -cCGb &

setxkbmap -layout es &

set_background.sh &

yad --notification --command='nvidia-settings' --image=$HOME/Multimedia/Pictures/Icons/System/Png/nvidia.png &

firewall-applet &

nm-applet --sm-disable &

cairo-dock > /dev/null 2>&1 &

easystroke &

imwheel.sh &

exec qtile start

