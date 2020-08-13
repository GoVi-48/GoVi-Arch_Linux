#!/usr/bin/env bash

killall polybar

qdbus org.kde.KWin /Compositor suspend

cd $HOME"/Games/-Library-/PC/Shadow of the Tomb Raider"

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.14-mf ~/Wine/wine-build_5.14-tkg/bin/wine64 "SOTTR.exe"

sleep 5

while pgrep -x "SOTTR.exe" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
