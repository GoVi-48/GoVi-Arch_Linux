#!/usr/bin/env bash

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_mf
export WINE=~/Wine/wine-build_5.17-tkg/usr/bin/wine64
 
cd $HOME"/Games/Ubisoft/Uplay"
gamemoderun $WINE "Uplay.exe"
