#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

gamemoderun "/Media/Games/PC/Mark of the Ninja/./start.sh"

sleep 5

killall lutris
killall gamemoded
qdbus org.kde.KWin /Compositor resume
$HOME/Scripts/Bash/Polybar
latte-dock &
plasmashell > /dev/null 2>&1 & exit
