#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEESYNC=1

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_5.17-HZD
export WINE=~/Wine/wine-build_Proton/wine-build_Proton-5.9-GE-6-ST/dist/bin/wine64

cd "$HOME/Games/-Library-/PC/Horizon Zero Dawn/"
gamemoderun $WINE "HorizonZeroDawn.exe"

sleep 5

while pgrep -x "HorizonZeroDawn.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
