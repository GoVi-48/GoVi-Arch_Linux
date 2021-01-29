#!/usr/bin/env bash

games_folder="/home/$USER/Games/PC/"
game_location="Trials Rising/datapack"
game_executable="trialsrising.exe"

export WINEPREFIX="/home/$USER/Wine/wine_Lutris/wine-pfx_Trials"
export WINE="/home/$USER/Wine/wine_Lutris/wine-build_5.21/bin/wine"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$games_folder$game_location"
gamemoderun $WINE "$game_executable"


while ! pgrep -x $game_executable > /dev/null; do sleep 1; done

if pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor suspend
    killall latte-dock
    killall polybar
fi

while pgrep -x "$game_executable" > /dev/null; do sleep 1; done
    
if ! pgrep -x "$game_executable"; then
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar 
    /home/$USER/Scripts/Bash/Latte_Dock.sh &
    killall upc.exe
    killall lutris
    sleep 1
    killall gamemoded
fi       
