#!/bin/bash

MONITOR="$(xrandr --listmonitors | awk '{print $2; exit}')"

if [ "$MONITOR" -eq 2 ];then
    xrandr --output VGA-1-1 --off

else
    xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --output VGA-1-1 --mode 1366x768 --right-of HDMI-0
    ~/Scripts/Shell/Autostart/set_background.sh
fi