#!/usr/bin/env bash

game_location="/home/$USER/.cemu"

export WINEPREFIX="/home/$USER/Wine/wine_5.18/wine-pfx_mf-dxvk-1.7.2"
export WINE="/home/$USER/Wine/wine_5.18/wine-build_tkg/bin/wine64"

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree=;mshtml=;dbghelp.dll=n,b"
export MANGOHUD=1
export ENABLE_VKBASALT=1

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar

cd "$game_location"
gamemoderun $WINE "Cemu.exe" -g "Z:/Media/Games/Nintendo/Wii U/Mario Kart 8/code/Mario Kart 8.rpx" -f
    
qdbus org.kde.KWin /Compositor resume
/home/$USER/Scripts/Bash/Polybar 
/home/$USER/Scripts/Bash/Latte_Dock.sh &
killall lutris
sleep 1
killall gamemoded
