#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

cd $HOME"/Games/-Library-/PC/A Plague Tale Innocence"

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.15/wine-pfx_5.15-dxvk-1.7.1-mf ~/Wine/wine-build_5.15-tkg/bin/wine64 "APlagueTaleInnocence_x64.exe"

sleep 5

while pgrep -x "APlagueTaleInnocence_x64.exe" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
