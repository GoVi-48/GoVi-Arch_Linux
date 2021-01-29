#!/usr/bin/env bash

games_location="/home/$USER/Games/PC"/
game_folder="Death Stranding"/
game_executable="ds.exe"

export WINEPREFIX=/home/$USER/Wine/"wine_Proton/wine-pfx_DS/pfx"
export WINE=/home/$USER/Wine/"wine_Proton/Proton-5.13/dist/bin"/wine64

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=0


cd "$games_location""$game_folder"
gamemoderun $WINE $game_executable &


while ! pgrep -x $game_executable > /dev/null; do sleep 1; done
    sleep 5
    killall lutris
    killall polybar
    sleep 1
    killall cairo-dock
    qdbus org.kde.KWin /Compositor suspend

while pgrep -x $game_executable > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar/launch.sh
    cairo-dock > /dev/null 2>&1 &
    sleep 5
    killall gamemoded &
    exit
