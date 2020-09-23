#!/usr/bin/env bash

export ENABLE_VKBASALT=0

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall plasmashell
killall polybar

gamemoderun steam steam://rungameid/244210 &

sleep 20

while pgrep -x AssettoCorsa.ex > /dev/null; do sleep 1; done
    sleep 5
    killall steam
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    latte-dock &
    plasmashell > /dev/null 2>&1 & 
    $HOME/Scripts/Bash/Polybar 
    exit
