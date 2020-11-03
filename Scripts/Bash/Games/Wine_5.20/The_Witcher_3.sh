#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_5.20/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine_5.20/wine-build_5.20-tkg/usr/bin/wine

cd "/Datos/Games/PC/The Witcher 3 Wild Hunt/bin/x64"
gamemoderun $WINE "witcher3.exe"

sleep 5

while pgrep -x "witcher3.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
