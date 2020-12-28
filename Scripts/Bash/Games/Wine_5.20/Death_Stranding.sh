#!/usr/bin/env bash

games_location="/home/$USER/Games/PC/"
game_folder="Death Stranding/"
game_executable="ds.exe"

export WINEPREFIX="/home/$USER/Wine/wine_5.20/wine-pfx_DS"
export WINE="/home/$USER/Wine/wine_5.20/wine-build_tkg/usr/bin/wine"

export WINEDEBUG="-all"
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$games_location""$game_folder"
gamemoderun $WINE "$game_executable"


while ! pgrep -x $game_executable > /dev/null; do sleep 1; done
    sleep 5
    killall lutris
    killall polybar
    killall cairo-dock
    qdbus org.kde.KWin /Compositor suspend

while pgrep -x $game_executable > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar/launch.sh
    cairo-dock > /dev/null 2>&1 &
    sleep 1
    killall gamemoded
