#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_MotoGP_20
export WINE=~/Wine/wine-build_Lutris/wine-build_5.7.8/bin/wine64

ENABLE_VKBASALT=1

cd "$HOME/Games/-Library-/PC/MotoGP 20"
mangohud gamemoderun $WINE "motogp20.exe"

sleep 5

while pgrep -x "motogp20.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
