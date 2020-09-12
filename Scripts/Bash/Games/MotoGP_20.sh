#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_Lutris/wine-build_5.7.10-lutris/bin/wine64

cd "$HOME/Games/-Library-/PC/MotoGP 20"
gamemoderun $WINE "motogp20.exe"

sleep 5

while pgrep -x "motogp20.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
