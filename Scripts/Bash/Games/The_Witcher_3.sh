#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

cd "/Datos/Games/PC/The Witcher 3 Wild Hunt/bin/x64"
gamemoderun $WINE "witcher3.exe"

sleep 5

while pgrep -x "witcher3.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
