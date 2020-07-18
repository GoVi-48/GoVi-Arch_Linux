#!/usr/bin/env bash

# /usr/bin/sudo /usr/bin/yay -Sya > /dev/null 2>&1

updates_AUR=$(yay -Qua | wc -l)
sound_AUR_off=$HOME/.config/polybar/scripts/sound_AUR_off
notf_on=~/.config/polybar/scripts/notf_on

if [ $updates_AUR -eq 0 ]; then
    echo -e "\c"
    if [ -f $sound_AUR_off ]; then
        rm -rf $sound_AUR_off
    fi

elif [ $updates_AUR -gt 0 ] && [ ! -f "$sound_AUR_off" ] && [ -f $notf_on ]; then
    echo %{F#e29519}"%{T3}7 %{T-}%{F-}$updates_AUR AUR"
    kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/updates-AUR.svg" --passivepopup "$updates_AUR AUR Updates" 8
    paplay $HOME/.local/share/sounds/long-dang.ogg
    touch $sound_AUR_off
    
else
    echo %{F#e29519}"%{T3}7 %{T-}%{F-}$updates_AUR AUR"
fi
