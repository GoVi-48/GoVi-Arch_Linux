#!/usr/bin/env bash

game_executable="Grounded.exe"
game_location="/home/$USER/Games/PC/Grounded/"

export WINEPREFIX="/home/$USER/Wine/wine_5.21/wine-pfx_Grounded"
export WINE="/home/$USER/Wine/wine_5.21/wine-build_tkg/usr/bin/wine"

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
    killall UnrealCEFSubProcess.exe
    sleep 1
    killall gamemoded
fi       
