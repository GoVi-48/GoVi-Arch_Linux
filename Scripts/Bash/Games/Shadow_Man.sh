#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

cd "$HOME/Games/-Library-/PC/Shadow Man"
gamemoderun wine "Shadowman.exe"

sleep 5

while pgrep -x "Shadowman.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
