#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_Trials_Fusion
export WINE=~/Wine/wine-build_Lutris/wine-build_5.7.10-lutris/bin/wine64

cd "/Datos/Games/Ubisoft/Trials Fusion/datapack"
gamemoderun $WINE "trials_fusion.exe"

sleep 5

while pgrep -x "UbisoftGameLaun" > /dev/null; do sleep 1; done
    killall upc.exe
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
