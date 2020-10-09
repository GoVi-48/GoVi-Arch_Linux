#!/usr/bin/env bash
 
killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.18/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine-build_5.18-tkg/bin/wine64

cd $HOME"/Games/-Library-/PC/DiRT Rally 2.0"
gamemoderun $WINE "dirtrally2.exe"

sleep 5

while pgrep -x "dirtrally2.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
