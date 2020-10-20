#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall plasmashell
killall polybar

mangohud gamemoderun steam steam://rungameid/13199544096852541440 &

sleep 20

while pgrep -x "NMS.exe" > /dev/null; do sleep 1; done
    killall steam
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
