#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1
export WINE=~/Wine/wine-build_Proton/wine-build_Proton-4.11-GE-1/dist/bin/wine64

cd $HOME"/Games/-Library-/PC/Valentino Rossi The Game"
gamemoderun $WINE "MotoGPVR46X64.exe"

sleep 5

while pgrep -x "MotoGPVR46X64.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
