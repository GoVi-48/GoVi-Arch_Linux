#!/usr/bin/env bash
 
qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_proton/wine-pfx_Proton-5.13
export WINE=~/Wine/wine-build_Proton/Proton-5.13/dist/bin/wine64

ENABLE_VKBASALT=1

cd $HOME"/Games/-Library-/PC/DiRT Rally 2.0"
gamemoderun $WINE "dirtrally2.exe"

sleep 5

while pgrep -x "dirtrally2.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
