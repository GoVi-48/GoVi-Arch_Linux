#!/usr/bin/env bash

killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.14/wine-pfx_5.14-dxvk-1.7.1-mf ~/Wine/wine-build_5.14-tkg/bin/wine64 $HOME"/Games/Emulators/Cemu/Cemu.exe"

qdbus org.kde.KWin /Compositor resume

~/Scripts/Bash/Polybar
