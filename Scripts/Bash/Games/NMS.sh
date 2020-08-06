#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun steam steam://rungameid/13597827194578534400 &

sleep 10

while pgrep -x NMS.exe > /dev/null; do sleep 1; done

if ! pgrep -x "NMS.exe" > /dev/null; then
    killall NMS.exe
    killall steam
    sleep 1
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    ~/Scripts/Bash/Polybar
fi
