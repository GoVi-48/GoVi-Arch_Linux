#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEPREFIX=~/Wine/wine-pfx_5.18/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine-build_5.18-tkg/bin/wine64

ENABLE_VKBASALT=1

cd "$HOME/Games/-Library-/PC/Ori and the Blind Forest"
mangohud gamemoderun $WINE "oriDE.exe"

sleep 5

while pgrep -x "oriDE.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
