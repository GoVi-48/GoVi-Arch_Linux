#!/usr/bin/env bash

game_executable="trials_fusion.exe"
game_location="/Datos/Games/Ubisoft/Trials Fusion/datapack"

export WINEPREFIX="/home/$USER/Wine/wine_Lutris/wine-pfx_Trials_Fusion"
export WINE="/home/$USER/Wine/wine_Lutris/wine-build_5.7.10/bin/wine"

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

while pgrep -x "UbisoftGameLaun" > /dev/null; do sleep 1; done
    
if ! pgrep -x "UbisoftGameLaun"; then
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar 
    /home/$USER/Scripts/Bash/Latte_Dock.sh &
    killall upc.exe
    killall lutris
    sleep 1
    killall gamemoded
fi       
