#!/usr/bin/env bash

location="/home/$USER/Games/PC/-Launchers/Bethesda/"
executable="BethesdaNetLauncher.exe"

export WINEPREFIX="/home/$USER/Wine/wine_5.20/wine-pfx_mf"
export WINE="/home/$USER/Wine/wine_5.20/wine-build_tkg/usr/bin/wine"

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$location"
gamemoderun $WINE "$executable"


while pgrep -x "$executable" > /dev/null; do sleep 1; done

if ! pgrep -x $executable; then
    sleep 1
    killall gamemoded
fi
