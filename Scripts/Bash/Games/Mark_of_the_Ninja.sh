#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_lutris-MOTN
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

cd $HOME"/Games/-Library-/PC/Mark of the Ninja/bin"
gamemoderun mangohud $WINE "Ninja.exe"

sleep 5

while pgrep -x "Ninja.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
