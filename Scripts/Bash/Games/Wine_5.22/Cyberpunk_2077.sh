#!/usr/bin/env bash

games_location="/home/$USER/Games/PC/"
game_folder="Cyberpunk 2077/bin/x64/"
game_executable="Cyberpunk2077.exe"

export WINEPREFIX="/home/$USER/Wine/wine_5.22/wine-pfx_mf-dxvk-1.7.3"
export WINE="/home/$USER/Wine/wine_5.22/wine-build_tkg/usr/bin/wine64"

PULSE_LATENCY_MSEC=60
export WINEDEBUG="-all"
export WINEDLLOVERRIDES="mscoree,mshtml=,xaudio2_7=n,b,"
export WINEFSYNC=0
export WINEESYNC=0
export MANGOHUD=1
export ENABLE_VKBASALT=0

cd "$games_location""$game_folder"
gamemoderun $WINE "$game_executable"


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
