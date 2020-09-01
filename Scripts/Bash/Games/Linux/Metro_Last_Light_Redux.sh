#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

cd "$HOME/Games/-Library-/PC/Metro Last Light Redux"
mangohud gamemoderun ./metro

sleep 5

while pgrep -x "metro" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
