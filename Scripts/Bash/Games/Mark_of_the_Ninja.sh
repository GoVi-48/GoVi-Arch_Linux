#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

gamemoderun "/Media/Games/PC/Mark of the Ninja/./start.sh"

sleep 5

qdbus org.kde.KWin /Compositor resume
killall lutris
killall gamemoded
~/Scripts/Bash/Polybar
