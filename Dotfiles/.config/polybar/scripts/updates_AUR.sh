#!/bin/bash

if ping -c5 google.com > /dev/null 2>&1; then

    UPDATES_AUR=$(yay -Qua | wc -l)
    NOTF_SOUND=~/.config/polybar/scripts/notf_sound

    if [ "$UPDATES_AUR" -eq 0 ]; then
        echo -e "\c"

    elif [ "$UPDATES_AUR" -gt 0 ] && [ -f $NOTF_SOUND ]; then
        echo %{F#e29519}"%{T3}7 %{T-}%{F-}$UPDATES_AUR AUR"
        kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/updates-AUR.svg" --passivepopup "$UPDATES_AUR AUR Updates" 8
        paplay $HOME/.local/share/sounds/long-dang.ogg

    elif [ "$UPDATES_AUR" -gt 0 ] && [ ! -f $NOTF_SOUND ]; then
        echo %{F#e29519}"%{T3}7 %{T-}%{F-}$UPDATES_AUR AUR"

    else
        echo -e "\c"

    fi
else
    echo -e "\c"
fi