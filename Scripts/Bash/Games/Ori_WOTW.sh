#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.15/wine-pfx_5.15-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.15-tkg/bin/wine64

cd $HOME"/Games/-Library-/PC/Ori and the Will of the Wisps"
gamemoderun $WINE "oriwotw.exe"

sleep 5

while pgrep -x "oriwotw.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
