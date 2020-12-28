#!/usr/bin/env bash

games_location="/home/$USER/Games/PC/"
game_folder="No Man's Sky/Binaries/"
game_executable="NMS.exe"

export WINEPREFIX="/home/$USER/Wine/wine_Lutris/wine-pfx_NMS"
export WINE="/home/$USER/Wine/wine_Lutris/wine-build_5.7.11/bin/wine"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

# gamemoderun steam steam://rungameid/13199544096852541440 &
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
