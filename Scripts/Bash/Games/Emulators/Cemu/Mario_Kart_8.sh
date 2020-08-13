#!/usr/bin/env bash

killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun mangohud WINEPREFIX=~/Wine/wine-pfx_5.14-dxvk-1.7-mf ~/Wine/wine-build_5.14-tkg/bin/wine64 $HOME"/Games/Emulators/Cemu/Cemu.exe" -g "Z:/Media/Games/Nintendo/Wii U/Mario Kart 8/code/Mario Kart 8.rpx" -f

qdbus org.kde.KWin /Compositor resume

~/Scripts/Bash/Polybar
