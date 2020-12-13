#!/usr/bin/env bash

game_executable="RocketLeague.exe"
game_location="/Datos/Games/Epic Games/rocketleague/Binaries/Win64/"

export WINEPREFIX="/home/$USER/Wine/wine-pfx_lutris/wine-pfx_Epic_Games"
export WINE="/home/$USER/Wine/wine_Lutris/wine-build_5.7.10/bin/wine64"

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$game_location"
gamemoderun $WINE $game_executable -epicportal

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
