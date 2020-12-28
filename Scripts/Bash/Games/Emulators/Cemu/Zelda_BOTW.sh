#!/usr/bin/env bash

game_location="/home/$USER/.cemu"

export WINEPREFIX="/home/$USER/Wine/wine_5.18/wine-pfx_mf-dxvk-1.7.2"
export WINE="/home/$USER/Wine/wine_5.18/wine-build_tkg/bin/wine64"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

killall polybar
killall cairo-dock
qdbus org.kde.KWin /Compositor suspend

cd "$game_location"
gamemoderun $WINE "Cemu.exe" -g "Z:/Media/Games/Nintendo/Wii U/The Legend of Zelda Breath of the Wild/code/U-King.rpx" -f
    

qdbus org.kde.KWin /Compositor resume
/home/$USER/Scripts/Bash/Polybar/launch.sh
cairo-dock > /dev/null 2>&1 &
sleep 1
killall gamemoded
