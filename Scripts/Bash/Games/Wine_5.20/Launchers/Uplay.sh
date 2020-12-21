#!/usr/bin/env bash

location="/home/$USER/Games/PC/-Launchers/Ubisoft/Ubisoft Game Launcher/"
executable="Uplay.exe"
process="upc.exe"

export WINEPREFIX="/home/$USER/Wine/wine_5.20/wine-pfx_mf"
export WINE="/home/$USER/Wine/wine_5.20/wine-build_tkg/usr/bin/wine"

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$location"
gamemoderun $WINE "$executable"

sleep 5

while pgrep -x "$process" > /dev/null; do sleep 1; done

if ! pgrep -x "$process"; then
    sleep 1
    killall gamemoded
fi
