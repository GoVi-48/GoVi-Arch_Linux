#!/usr/bin/env bash

games_location="/home/$USER/Games/PC/"
game_folder="Shadow of the Tomb Raider/"
game_executable="ShadowOfTheTombRaider"

export MANGOHUD=1
export ENABLE_VKBASALT=1

cd "$games_location""$game_folder"
gamemoderun "./start"


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
