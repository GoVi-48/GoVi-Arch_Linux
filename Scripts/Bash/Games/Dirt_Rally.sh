#!/usr/bin/env bash
 
killall polybar

gamemoderun steam steam://rungameid/310560 &

sleep 10

while pgrep -x DirtRally > /dev/null; do sleep 1; done

if ! pgrep -x "DirtRally" > /dev/null; then
    killall DirtRally
    killall steam
    sleep 1
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
fi
