#!/usr/bin/env bash

game_executable="motogp20.exe"
game_location="/home/$USER/Games/PC/MotoGP 20/"

export WINEPREFIX="/home/$USER/Wine/wine_Lutris/wine-pfx_MotoGP_20"
export WINE="/home/$USER/Wine/wine_Lutris/wine-build_5.7.8/bin/wine"

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
