#!/usr/bin/env bash

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree=;mshtml=;dbghelp.dll=n,b"
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_5.18/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine_5.18/wine-build_5.18-tkg/bin/wine64

cd ~/.cemu
gamemoderun $WINE "Cemu.exe" "$@"

killall gamemoded
