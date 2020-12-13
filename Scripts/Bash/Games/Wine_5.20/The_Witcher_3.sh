#!/usr/bin/env bash

game_executable="witcher3.exe"
game_location="/Datos/Games/PC/The Witcher 3 Wild Hunt/bin/x64/"

export WINEPREFIX="/home/$USER/Wine/wine_5.20/wine-pfx_mf-dxvk-1.7.2"
export WINE="/home/$USER/Wine/wine_5.20/wine-build_tkg/usr/bin/wine64"

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$game_location"
gamemoderun $WINE $game_executable

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
