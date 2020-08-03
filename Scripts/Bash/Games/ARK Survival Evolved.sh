#!/usr/bin/env bash
 
killall polybar

lutris lutris:rungameid/16 &

sleep 2

while pgrep -x wineserver > /dev/null; do sleep 1; done

if ! pgrep -x "wineserver" > /dev/null; then
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
fi
