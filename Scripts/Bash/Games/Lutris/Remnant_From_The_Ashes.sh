#!/usr/bin/env bash
 
killall polybar

lutris lutris:rungameid/6 &

sleep 2

while pgrep -x "Remnant-Win64-Shipping.exe" > /dev/null; do sleep 1; done

if ! pgrep -x "Remnant-Win64-Shipping.exe" > /dev/null; then
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
fi
