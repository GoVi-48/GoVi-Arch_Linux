#!/usr/bin/env bash

killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun && mangohud WINEPREFIX=~/Wine/wine-pfx_5.13-dxvk-1.7 ~/Wine/wine-build_5.13-tkg/bin/wine64 $HOME"/Games/Emulators/Cemu/Cemu.exe" -g "Z:/Media/Games/Nintendo/Wii U/The Legend of Zelda Breath of the Wild/code/U-King.rpx" -f

qdbus org.kde.KWin /Compositor resume

~/Scripts/Bash/Polybar
