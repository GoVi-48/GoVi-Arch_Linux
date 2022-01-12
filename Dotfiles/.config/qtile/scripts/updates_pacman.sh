#!/bin/bash

while ! ping -c2 google.com > /dev/null 2>&1; do sleep 10; done

pgrep -x "wineserver" > /dev/null  && exit

UPDATES_PACMAN=$(pacman -Qu | wc -l)
notf_ON=~/.config/qtile/scripts/notf_ON
notf_Updates=~/.config/qtile/scripts/notf_UpdatesP

if [ "$UPDATES_PACMAN" -eq 0 ]; then
    echo

elif [ "$UPDATES_PACMAN" -gt 1 ] && [ -f $notf_ON ] && [ ! -f $notf_Updates ]; then
    echo "$UPDATES_PACMAN pacman"
    notify-send -i '/home/govi/Multimedia/Pictures/Icons/Themes/GoVi/apps/64/updates-pacman.svg' "Arch Linux" "Updates available"  -t 5000 &
    paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
    touch $notf_Updates

elif [ "$UPDATES_PACMAN" -gt 1 ] && [ -f $notf_ON ]; then
    echo "$UPDATES_PACMAN pacman"

elif [ "$UPDATES_PACMAN" -gt 1 ] && [ ! -f $notf_ON ]; then
    echo "$UPDATES_PACMAN pacman"

else
    echo
fi

exit