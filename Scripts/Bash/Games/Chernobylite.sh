#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor suspend

cd $HOME"/Games/-Library-/PC/Chernobylite/ChernobylGame/Binaries/Win64"

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.14-dxvk-1.7.1-mf ~/Wine/wine-build_5.14-tkg/bin/wine64 "ChernobylGame-Win64-Shipping.exe"

sleep 5

while pgrep -x "ChernobylGame-Win64-Shipping.exe" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
