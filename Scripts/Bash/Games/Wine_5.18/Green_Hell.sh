#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_5.18/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine_5.18/wine-build_5.18-tkg/bin/wine

cd "$HOME/Games/-Library-/PC/Green Hell"
mangohud gamemoderun $WINE "GH.exe"

sleep 5

while pgrep -x "GH.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
