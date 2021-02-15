#!/bin/bash

if ping -c5 google.com > /dev/null 2>&1; then

    UPDATES_PACMAN=$(pacman -Qu | wc -l)
    notf_ON=~/.config/qtile/scripts/notf_sound

    if [ "$UPDATES_PACMAN" -eq 0 ]; then
        echo -e "\c"

    elif [ "$UPDATES_PACMAN" -gt 0 ] && [ -f $notf_ON ]; then
        echo "$UPDATES_PACMAN pacman"
        zenity --info --text "$UPDATES_PACMAN pacman Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
        paplay $HOME/.local/share/sounds/long-dang.ogg
        touch ~/.config/qtile/scripts/updates-pacman_icon

    elif [ "$UPDATES_PACMAN" -gt 0 ] && [ ! -f $notf_ON ]; then
        echo "$UPDATES_PACMAN pacman"
        touch ~/.config/qtile/scripts/updates-pacman_icon

    else
        echo -e "\c"

    fi

else
    echo -e "\c"

fi