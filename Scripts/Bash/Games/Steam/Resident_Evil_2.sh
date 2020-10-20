#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall plasmashell
killall polybar

mangohud gamemoderun steam steam://rungameid/10110539261779378176 & 

sleep 20

while pgrep -x "re2.exe" > /dev/null; do sleep 1; done
    sleep 5
    killall steam
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
