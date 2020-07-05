#!/usr/bin/env bash

updates_pacman=$(echo $(pacman -Qu | wc -l))

if [ $updates_pacman -eq 0 ]; then
    touch ~/.config/polybar/scripts/updates
    sleep 10
    rm -rf ~/.config/polybar/scripts/updates
    
else
    echo %{F#0095ff}"  %{F-}$updates_pacman pacman"
fi
 

