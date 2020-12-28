#!/usr/bin/env bash

games_location="/home/$USER/Games/PC/"
game_folder="Red Dead Redemption 2/"
game_executable="RDR2.exe"

export WINEPREFIX="/home/$USER/Wine/wine_5.20/wine-pfx_RDR2"
export WINE="/home/$USER/Wine/wine_5.20/wine-build_tkg-Custom/bin/wine"

# WINEDEBUG=-all,relay
export PULSE_LATENCY_MSEC=60
export WINEDLLOVERRIDES="dxgi=n,b"
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$games_location""$game_folder"
gamemoderun $WINE "$game_executable" -ignorepipelinecache -vulkan &


sleep 10

if pgrep -x $game_executable; then
    PID=$(pgrep $game_executable)
    kill -s SIGSTOP $PID
    kill -s SIGCONT $PID
fi

sleep 5

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

