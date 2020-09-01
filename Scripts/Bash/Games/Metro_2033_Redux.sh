#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

cd "/Datos/Games/Epic Games/Metro2033Redux"
gamemoderun $WINE "metro.exe" -epicportal

sleep 5

while pgrep -x "metro.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
