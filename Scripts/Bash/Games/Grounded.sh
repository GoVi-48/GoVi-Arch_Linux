#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_Grounded
export WINE=~/Wine/wine-build_5.17-tkg/usr/bin/wine64

cd $HOME"/Games/-Library-/PC/Grounded"
mangohud gamemoderun $WINE "Grounded.exe"

sleep 5

while pgrep -x "Grounded.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    killall UnrealCEFSubProcess.exe
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
