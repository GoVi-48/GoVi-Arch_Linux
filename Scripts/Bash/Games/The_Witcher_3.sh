#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.17-tkg/usr/bin/wine64

cd "/Datos/Games/PC/The Witcher 3 Wild Hunt/bin/x64"
gamemoderun $WINE "witcher3.exe"

sleep 5

while pgrep -x "witcher3.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
