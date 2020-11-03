#!/usr/bin/env bash

export WINEPREFIX=~/Wine/wine_5.20/wine-pfx_mf
export WINE=~/Wine/wine_5.20/wine-build_5.20-tkg/usr/bin/wine

cd /Datos/Games/Bethesda
gamemoderun $WINE "BethesdaNetLauncher.exe"
