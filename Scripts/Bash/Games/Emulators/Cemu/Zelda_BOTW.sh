#!/usr/bin/env bash

game_location="/home/$USER/.cemu"

export WINEPREFIX="/home/$USER/Wine/wine_5.18/wine-pfx_mf-dxvk-1.7.2"
export WINE="/home/$USER/Wine/wine_5.18/wine-build_tkg/bin/wine64"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

qdbus org.kde.KWin /Compositor suspend
killall cairo-dock
killall polybar

cd "$game_location"
gamemoderun $WINE "Cemu.exe" -g "Z:/Media/Games/Nintendo/Wii U/The Legend of Zelda Breath of the Wild/code/U-King.rpx" -f
    

qdbus org.kde.KWin /Compositor resume
/home/$USER/Scripts/Bash/Polybar 
cairo-dock
killall lutris
sleep 1
killall gamemoded
