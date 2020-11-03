#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_5.18/wine-pfx_Grounded
export WINE=~/Wine/wine_5.18/wine-build_5.18-tkg/bin/wine64

cd "$HOME/Games/-Library-/PC/Grounded"
gamemoderun $WINE "Grounded.exe"

sleep 5

while pgrep -x "Grounded.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    killall UnrealCEFSubProcess.exe
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
