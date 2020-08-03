#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.14-dxvk-1.7-mf ~/Wine/wine-build_5.14-tkg/bin/wine64 $HOME"/Games/-Library-/PC/DiRT Rally 2.0/dirtrally2.exe"

while pgrep -x "wineserver" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
