#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

cd $HOME"/Games/-Library-/PC/Ghost of a Tale"

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.15/wine-pfx_5.15-dxvk-1.7.1-mf ~/Wine/wine-build_5.15-tkg/bin/wine64 "GoaT.exe"

sleep 5

while pgrep -x "GoaT.exe" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
