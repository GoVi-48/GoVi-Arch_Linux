#!/usr/bin/env bash

updates_pacman=$(pacman -Qu | wc -l)
notf_sound=~/.config/polybar/scripts/notf_sound

if [ "$updates_pacman" -eq 0 ]; then
    echo -e "\c"

elif [ "$updates_pacman" -gt 0 ] && [ -f $notf_sound ]; then
    if [ "$updates_pacman" != "^Get" ]; then
        echo %{F#0095ff}"%{T3}7 %{T-}%{F-}$updates_pacman pacman"
        kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/updates-pacman.svg" --passivepopup "$updates_pacman pacman Updates" 8
        paplay $HOME/.local/share/sounds/long-dang.ogg
    fi

elif [ "$updates_pacman" -gt 0 ] && [ ! -f $notf_sound ]; then
    if [ "$updates_pacman" != "^Get" ] ;then
        echo %{F#0095ff}"%{T3}7 %{T-}%{F-}$updates_pacman pacman"
    fi
    
else   
    echo -e "\c"
    
fi
