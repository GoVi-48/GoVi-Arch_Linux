#!/usr/bin/env bash

updates_pacman=$(echo $(pacman -Qu | wc -l))

if [ $updates_pacman -eq 0 ]; then
    echo -e "\c"
    
else
    echo %{F#0095ff}"  %{F-}$updates_pacman pacman"
fi
 

