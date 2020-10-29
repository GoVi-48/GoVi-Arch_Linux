#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

MESA_EXTENSION_MAX_YEAR=2003
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEPREFIX=~/Wine/wine-pfx_5.19/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine-build_5.19-tkg/usr/bin/wine64

ENABLE_VKBASALT=1

cd "$HOME/Games/-Library-/PC/Star Wars Jedi Fallen Order/SwGame/Binaries/Win64/"
mangohud gamemoderun $WINE "starwarsjedifallenorder.exe"

sleep 5

while pgrep -x "starwarsjedifallenorder.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
