#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_Proton/wine-build_Proton-5.0/dist/bin/wine64

cd "$HOME/Games/-Library-/PC/Resident Evil 2"
gamemoderun $WINE "re2.exe"

sleep 5

while pgrep -x "re2.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
