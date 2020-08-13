#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

cd $HOME"/Games/-Library-/PC/DiRT Rally 2.0"

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.14-dxvk-1.7.1-mf ~/Wine/wine-build_5.14-tkg/bin/wine64 "dirtrally2.exe"

sleep 5

while pgrep -x "dirtrally2.exe" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
