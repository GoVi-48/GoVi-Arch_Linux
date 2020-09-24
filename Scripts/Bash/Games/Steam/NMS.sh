#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall plasmashell
killall polybar

gamemoderun steam steam://rungameid/13597827194578534400 &

sleep 20

while pgrep -x "NMS.exe" > /dev/null; do sleep 1; done
    killall steam
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    latte-dock &
    plasmashell > /dev/null 2>&1 & 
    $HOME/Scripts/Bash/Polybar 
    exit
