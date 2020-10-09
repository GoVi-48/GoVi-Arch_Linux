#!/usr/bin/env bash

export WINEPREFIX=~/Wine/wine-pfx_5.18/wine-pfx_mf
export WINE=~/Wine/wine-build_5.18-tkg/bin/wine64

cd /Datos/Games/Bethesda
gamemoderun $WINE "BethesdaNetLauncher.exe"
