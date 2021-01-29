#!/usr/bin/env bash

game_executable="ShooterGame.exe"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1


lutris lutris:rungameid/16 &


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
