#!/usr/bin/env bash

killall polybar

qdbus org.kde.KWin /Compositor suspend

gamemoderun WINEPREFIX=~/Wine/wine-pfx_5.13-dxvk-1.7 ~/Wine/wine-build_5.13-tkg/bin/wine64 $HOME"/Games/Emulators/Cemu/Cemu.exe"

qdbus org.kde.KWin /Compositor resume

~/Scripts/Bash/Polybar
