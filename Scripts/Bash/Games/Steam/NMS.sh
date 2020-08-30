#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

gamemoderun steam steam://rungameid/13597827194578534400

sleep 20

while pgrep -x "NMS.exe" > /dev/null; do sleep 1; done
    sleep 5
    killall steam
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    ~/Scripts/Bash/Polybar
