#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree=;mshtml=;dbghelp.dll=n,b"
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_5.18/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine_5.18/wine-build_5.18-tkg/bin/wine64

cd ~/.cemu
gamemoderun $WINE "Cemu.exe" -g "Z:/Media/Games/Nintendo/Wii U/Mario Kart 8/code/Mario Kart 8.rpx" -f

killall lutris
killall gamemoded
qdbus org.kde.KWin /Compositor resume
$HOME/Scripts/Bash/Polybar
latte-dock &
plasmashell > /dev/null 2>&1 &
exit
