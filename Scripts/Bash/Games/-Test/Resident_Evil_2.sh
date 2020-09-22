#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_proton/wine-pfx_Proton-5.9-GE-6-ST-Resident_Evil_2
export WINE=~/Wine/wine-build_Proton/wine-build_Proton-5.9-GE-6-ST/dist/bin/wine64

cd "/Datos/Games/PC/Resident Evil 2"
gamemoderun $WINE "re2.exe"

sleep 5

while pgrep -x "re2.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    ~/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
    
