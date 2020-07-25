#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.13-dxvk-1.7 ~/Wine/wine-build_5.13-tkg/bin/wine64 "/Datos/Games/PC/Shadow of the Tomb Raider/SOTTR.exe"

while pgrep -x "wineserver" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
