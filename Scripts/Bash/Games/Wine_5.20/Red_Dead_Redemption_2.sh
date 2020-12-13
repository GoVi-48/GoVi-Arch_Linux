#!/usr/bin/env bash

game_executable="RDR2.exe"
game_location="/home/$USER/Games/PC/Red Dead Redemption 2/"

export WINEPREFIX="/home/$USER/Wine/wine_5.20/wine-pfx_RDR2"
export WINE="/home/$USER/Wine/wine_5.20/wine-build_tkg-Custom/bin/wine"

# WINEDEBUG=-all,relay
PULSE_LATENCY_MSEC=60
export WINEFSYNC=1
export WINEDLLOVERRIDES="dxgi=n,b"
export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$game_location"
gamemoderun $WINE $game_executable -ignorepipelinecache -vulkan &

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

