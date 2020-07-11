#!/usr/bin/env bash

/usr/bin/sudo /usr/bin/pacman -Sy > /dev/null 2>&1

updates_pacman=$(pacman -Qu | wc -l)
sound_pacman_off=$HOME/.config/polybar/scripts/sound_pacman_off

if [ $updates_pacman -eq 0 ]; then
    echo -e "\c"
    rm -rf $sound_pacman_off

elif [ $updates_pacman -gt 0 ] && [ ! -f "$sound_pacman_off" ]; then
    echo %{F#0095ff}"  %{F-}$updates_pacman pacman"
    kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/updates-pacman.svg" --passivepopup "$updates_pacman pacman Updates" 8 &
    paplay $HOME/.local/share/sounds/long-dang.ogg
    touch $sound_pacman_off
    
else
    echo %{F#0095ff}"  %{F-}$updates_pacman pacman"
fi
