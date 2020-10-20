#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEESYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEPREFIX=~/Wine/wine-pfx_proton/wine-pfx_HZD
export WINE=~/Wine/wine-build_Proton/Proton-5.13/dist/bin/wine64

ENABLE_VKBASALT=1

cd "$HOME/Games/-Library-/PC/Horizon Zero Dawn/"
mangohud gamemoderun $WINE "HorizonZeroDawn.exe"

sleep 5

while pgrep -x "HorizonZeroDawn.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
