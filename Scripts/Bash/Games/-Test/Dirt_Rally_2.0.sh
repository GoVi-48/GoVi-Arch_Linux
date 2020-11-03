#!/usr/bin/env bash
 
# qdbus org.kde.KWin /Compositor suspend
# killall latte-dock
# killall polybar
# killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=0
export ENABLE_VKBASALT=0

export WINEPREFIX=~/Wine/wine_5.20/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine_5.20/wine-build_5.20-tkg/usr/bin/wine

cd $HOME"/Games/-Library-/PC/DiRT Rally 2.0"
$WINE "dirtrally2.exe"

# sleep 5
# 
# while pgrep -x "dirtrally2.exe" > /dev/null; do sleep 1; done
#     killall lutris
#     killall gamemoded
#     qdbus org.kde.KWin /Compositor resume
#     $HOME/Scripts/Bash/Polybar
#     latte-dock &
#     plasmashell > /dev/null 2>&1 & exit
