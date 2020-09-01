#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export RADV_PERFTEST=aco
ulimit -n 1048576
export WINEESYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf-Chernobylite
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

cd "$HOME/Games/-Library-/PC/Chernobylite"
gamemoderun $WINE "ChernobylGame.exe"

sleep 5

while pgrep -x "ChernobylGame-Win64-Shipping.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    killall UnrealCEFSubProcess.exe
    ~/Scripts/Bash/Polybar
