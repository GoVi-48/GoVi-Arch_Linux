#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_lutris-Sekiro
export WINE=~/Wine/wine-build_Lutris/wine-build_5.7.10-lutris/bin/wine64

cd "$HOME/Games/-Library-/PC/Sekiro - Shadows Die Twice"
gamemoderun $WINE "sekiro.exe"

sleep 5

while pgrep -x "sekiro.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
