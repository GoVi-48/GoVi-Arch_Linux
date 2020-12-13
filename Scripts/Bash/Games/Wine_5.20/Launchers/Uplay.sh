#!/usr/bin/env bash

export WINEPREFIX="/home/$USER/Wine/wine_5.20/wine-pfx_mf"
export WINE="/home/$USER/Wine/wine_5.20/wine-build_tkg/usr/bin/wine"

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "/home/$USER/Games/PC/-Launchers/Ubisoft/Uplay/"
gamemoderun $WINE "Uplay.exe"

sleep 1
killall gamemoded
