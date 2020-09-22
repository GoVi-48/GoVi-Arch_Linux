#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_Grounded
export WINE=~/Wine/wine-build_5.17-tkg/usr/bin/wine64

cd $HOME"/Games/-Library-/PC/Grounded"
mangohud gamemoderun $WINE "Grounded.exe"

sleep 5

while pgrep -x "Grounded.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    killall UnrealCEFSubProcess.exe
    ~/Scripts/Bash/Polybar
