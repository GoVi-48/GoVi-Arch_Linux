#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

cd "/usr/share/cemu"
gamemoderun mangohud $WINE "Cemu.exe" -g "Z:/Media/Games/Nintendo/Wii U/The Legend of Zelda Breath of the Wild/code/U-King.rpx" -f

qdbus org.kde.KWin /Compositor resume
~/Scripts/Bash/Polybar
