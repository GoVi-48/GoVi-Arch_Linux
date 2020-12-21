#!/usr/bin/env bash

game_executable="DirtRally"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

gamemoderun steam steam://rungameid/310560 &


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
    killall steam
    killall lutris
    sleep 1
    killall gamemoded
fi
