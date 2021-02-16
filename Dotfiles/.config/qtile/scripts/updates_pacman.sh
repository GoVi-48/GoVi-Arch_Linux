#!/bin/bash

while true; do
    if ping -c2 google.com > /dev/null 2>&1; then
        UPDATES_PACMAN=$(pacman -Qu | wc -l)
        notf_ON=~/.config/qtile/scripts/notf_ON

        if [ "$UPDATES_PACMAN" -eq 0 ]; then
            echo; break

        elif [ "$UPDATES_PACMAN" -gt 0 ] && [ -f $notf_ON ]; then
            echo "$UPDATES_PACMAN pacman"
            zenity --info --text "$UPDATES_PACMAN pacman Updates" 2> /dev/null &
            paplay $HOME/.local/share/sounds/long-dang.ogg
            break

        elif [ "$UPDATES_PACMAN" -gt 0 ] && [ ! -f $notf_ON ]; then
            echo "$UPDATES_PACMAN pacman"
            break
        fi
    else
        echo; sleep 5
    fi
done
