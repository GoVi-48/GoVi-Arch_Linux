#!/usr/bin/env bash
 
killall polybar

lutris lutris:rungameid/27 &

sleep 2

while pgrep -x "Grounded.exe" > /dev/null; do sleep 1; done

if ! pgrep -x "Grounded.exe" > /dev/null; then
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
fi

