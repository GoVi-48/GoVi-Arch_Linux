#!/usr/bin/env bash

killall polybar

qdbus org.kde.KWin /Compositor suspend

cd "/Datos/Games/Ubisoft/Trials Fusion/datapack"

gamemoderun WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_lutris-default ~/Wine/wine-build_Lutris/wine-build_5.7.8-lutris/bin/wine64 "trials_fusion.exe" &&

sleep 5

while pgrep -x "UbisoftGameLaun" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall upc.exe
killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
