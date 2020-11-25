#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_Proton/wine-pfx_HZD
export WINE=~/Wine/wine_Proton/Proton-5.21-GE-1/dist/bin/wine

cd "$HOME/Games/-Library-/PC/Horizon Zero Dawn/"
gamemoderun $WINE "HorizonZeroDawn.exe"

sleep 5

while pgrep -x "HorizonZeroDawn.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
