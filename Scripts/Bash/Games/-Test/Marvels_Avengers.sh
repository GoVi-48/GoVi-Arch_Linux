#!/usr/bin/env bash

# qdbus org.kde.KWin /Compositor suspend
# killall latte-dock
# killall polybar
# killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=0
export ENABLE_VKBASALT=0

export WINEPREFIX=~/Wine/wine_5.22/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine_5.22/wine-tkg/usr/bin/wine

cd "/Datos/Games/PC/Marvels Avengers"
$WINE "avengers.exe"

# sleep 5
# 
# while pgrep -x "avengers.exe" > /dev/null; do sleep 1; done
#     killall lutris
#     killall gamemoded
#     qdbus org.kde.KWin /Compositor resume
#     $HOME/Scripts/Bash/Polybar
#     latte-dock &
#     plasmashell > /dev/null 2>&1 &
#     exit
