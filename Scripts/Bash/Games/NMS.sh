#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.13-dxvk-1.7-mf ~/Wine/wine-build_5.13-tkg/bin/wine64 $HOME"/Games/-Library-/PC/No Man's Sky/Binaries/NMS.exe"

while pgrep -x "wineserver" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
