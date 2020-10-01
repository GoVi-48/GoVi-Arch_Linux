#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_5.18/wine-pfx_dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.18-tkg/bin/wine64

cd $HOME"/Games/-Library-/PC/Dark Souls III/Game"
gamemoderun $WINE "DarkSoulsIII.exe"

sleep 5

while pgrep -x "DarkSoulsIII.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
