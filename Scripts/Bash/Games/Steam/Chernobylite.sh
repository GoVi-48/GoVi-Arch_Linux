#!/usr/bin/env bash
 
killall polybar
qdbus org.kde.KWin /Compositor suspend

export RADV_PERFTEST=llvm

gamemoderun steam steam://rungameid/16394953160386412544

sleep 20

while pgrep -x ChernobylGame-Win64-Shipping.exe > /dev/null; do sleep 1; done
    sleep 5
    killall steam
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    ~/Scripts/Bash/Polybar
