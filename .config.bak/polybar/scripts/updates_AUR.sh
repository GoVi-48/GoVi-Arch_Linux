#!/bin/bash

updates_AUR=$(yay -Qua | wc -l)
notf_sound=~/.config/polybar/scripts/notf_sound

if [ "$updates_AUR" -eq 0 ]; then
    echo -e "\c"

elif [ "$updates_AUR" -gt 0 ] && [ -f $notf_sound ]; then
    if [ "$updates_AUR" != "^Get" ]; then
        echo %{F#e29519}"%{T3}7 %{T-}%{F-}$updates_AUR AUR"
        kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/updates-AUR.svg" --passivepopup "$updates_AUR AUR Updates" 8
        paplay $HOME/.local/share/sounds/long-dang.ogg
    fi
    
elif [ "$updates_AUR" -gt 0 ] && [ ! -f $notf_sound ]; then
    if [ "$updates_AUR" != "^Get" ]; then
        echo %{F#e29519}"%{T3}7 %{T-}%{F-}$updates_AUR AUR"
    fi

else   
    echo -e "\c"
    
fi
