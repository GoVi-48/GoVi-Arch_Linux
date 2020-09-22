#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEESYNC=1

export WINEPREFIX=~/Wine/wine-pfx_proton/wine-pfx_Proton-5.9-GE-6-ST-HZD
export WINE=~/Wine/wine-build_Proton/wine-build_Proton-5.9-GE-6-ST/dist/bin/wine64
export WINEDLLOVERRIDES="mscoree,mshtml="

cd "$HOME/Games/-Library-/PC/Horizon Zero Dawn/"
gamemoderun $WINE "HorizonZeroDawn.exe"

sleep 5

while pgrep -x "HorizonZeroDawn.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    ~/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
