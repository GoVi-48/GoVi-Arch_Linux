#!/usr/bin/env bash

game_executable="Sam4.exe"
games_location="/home/$USER/Games/PC/"
$game_folder="Serious Sam 4/Bin/x64/"

export WINEPREFIX="/home/$USER/Wine/wine_5.19/wine-pfx_SS4"
export WINE="/home/$USER/Wine/wine_5.21/wine-build_tkg/usr/bin/wine64"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$games_location""$game_folder"
gamemoderun $WINE "$game_executable" +gfx_strAPI Vulkan +sfx_strAPI openal


while ! pgrep -x $game_executable > /dev/null; do sleep 1; done

if pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor suspend
    killall cairo-dock
    killall polybar
fi

while pgrep -x $game_executable > /dev/null; do sleep 1; done
    
if ! pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar 
    cairo-dock > /dev/null 2>&1 &
    killall lutris
    sleep 1
    killall gamemoded
fi       
