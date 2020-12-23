#!/usr/bin/env bash

games_location="/home/$USER/Games/PC/"
game_folder="Green Hell/"
game_executable="GH.exe"

export WINEPREFIX="/home/$USER/Wine/wine_5.21/wine-pfx_mf-dxvk-1.7.2"
export WINE="/home/$USER/Wine/wine_5.21/wine-build_tkg/usr/bin/wine"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$games_location""$game_folder"
gamemoderun $WINE "$game_executable"


while ! pgrep -x $game_executable > /dev/null; do sleep 1; done

if pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor suspend
    killall cairo-dock
    killall polybar
fi

while pgrep -x $game_executable > /dev/null; do sleep 1; done
    
if ! pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar/launch.sh 
    cairo-dock > /dev/null 2>&1 &
    killall lutris
    sleep 1
    killall gamemoded
fi    
