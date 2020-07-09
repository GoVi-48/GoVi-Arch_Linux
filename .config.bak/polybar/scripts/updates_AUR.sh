#!/usr/bin/env bash

updates_AUR=$(yay -Qua --quiet | wc -l)
sound_AUR_off=$HOME/.config/polybar/scripts/sound_AUR_off

if [ $updates_AUR -eq 0 ]; then
    echo -e "\c"
    rm -rf $sound_AUR_off

elif [ $updates_AUR -gt 0 ] && [ ! -f "$sound_AUR_off" ]; then
    echo %{F#e29519}"  %{F-}$updates_AUR AUR"
    kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/updates-AUR.svg" --passivepopup "$updates_AUR AUR" 8 &
    paplay $HOME/.local/share/sounds/long-dang.ogg
    touch $sound_AUR_off
    
else
    echo %{F#e29519}"  %{F-}$updates_AUR AUR"
fi
