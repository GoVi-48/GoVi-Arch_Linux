#!/usr/bin/env bash

game_executable="Sam4.exe"
game_location="/home/$USER/Games/PC/Serious Sam 4/Bin/x64/"

export WINEPREFIX="/home/$USER/Wine/wine_5.19/wine-pfx_SS4"
export WINE="/home/$USER/Wine/wine_5.21/wine-build_tkg/usr/bin/wine64"

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$game_location"
gamemoderun $WINE $game_executable +gfx_strAPI Vulkan +sfx_strAPI openal

while ! pgrep -x $game_executable > /dev/null; do sleep 1; done

if pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor suspend
    killall latte-dock
    killall polybar
fi

while pgrep -x $game_executable > /dev/null; do sleep 1; done
    
if ! pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar 
    /home/$USER/Scripts/Bash/Latte_Dock.sh &
    killall lutris
    sleep 1
    killall gamemoded
fi       
