#!/usr/bin/env bash

# qdbus org.kde.KWin /Compositor suspend
# killall polybar
# killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.17-tkg/usr/bin/wine64
export WINEDLLOVERRIDES="mscoree=;mshtml=;dbghelp.dll=n,b"

cd ~/.cemu
gamemoderun $WINE "Cemu.exe" "$@"

killall gamemoded
# qdbus org.kde.KWin /Compositor resume
# $HOME/Scripts/Bash/Polybar
# plasmashell > /dev/null 2>&1 & exit
