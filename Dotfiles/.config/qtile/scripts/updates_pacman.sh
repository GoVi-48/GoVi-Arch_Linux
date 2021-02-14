#!/bin/bash

if ping -c5 google.com > /dev/null 2>&1; then

    UPDATES_PACMAN=$(pacman -Qu | wc -l)
    NOTF_SOUND=~/.config/polybar/scripts/notf_sound

    if [ "$UPDATES_PACMAN" -eq 0 ]; then
        echo -e "\c"

    elif [ "$UPDATES_PACMAN" -gt 0 ] && [ -f $NOTF_SOUND ]; then
        echo %{F#0095ff}"%{T3}7 %{T-}%{F-}$UPDATES_PACMAN pacman"
        kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/updates-pacman.svg" --passivepopup "$UPDATES_PACMAN pacman Updates" 8
        paplay $HOME/.local/share/sounds/long-dang.ogg

    elif [ "$UPDATES_PACMAN" -gt 0 ] && [ ! -f $NOTF_SOUND ]; then
        echo %{F#0095ff}"%{T3}7 %{T-}%{F-}$UPDATES_PACMAN pacman"

    else
        echo -e "\c"

    fi

else
    echo -e "\c"

fi