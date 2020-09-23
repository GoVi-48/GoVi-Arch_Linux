#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.17-tkg/usr/bin/wine64

cd "/Datos/Games/Epic Games/Metro2033Redux"
gamemoderun $WINE "metro.exe" -epicportal

sleep 5

while pgrep -x "metro.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
