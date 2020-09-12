#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_lutris-TrialsF
export WINE=~/Wine/wine-build_Lutris/wine-build_5.7.10-lutris/bin/wine64

cd "/Datos/Games/Ubisoft/Trials Fusion/datapack"
gamemoderun $WINE "trials_fusion.exe"

sleep 5

while pgrep -x "UbisoftGameLaun" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall upc.exe
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
