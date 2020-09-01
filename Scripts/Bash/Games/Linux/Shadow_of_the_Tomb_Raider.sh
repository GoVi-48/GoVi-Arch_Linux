#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

gamemoderun "$HOME/Games/-Library-/PC/Shadow of the Tomb Raider/start"

sleep 5

while pgrep -x "ShadowOfTheTombRaider" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
