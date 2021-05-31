#!/bin/bash

pgrep -x "wineserver" > /dev/null  && exit

UPDATES_PACMAN=$(pacman -Qu | wc -l)
notf_ON=~/.config/qtile/scripts/notf_ON

if [ "$UPDATES_PACMAN" -eq 0 ]; then
    echo

elif [ "$UPDATES_PACMAN" -gt 0 ] && [ -f $notf_ON ]; then
    echo "$UPDATES_PACMAN pacman"
    notify-send -i '/home/govi/Multimedia/Pictures/Icons/Themes/GoVi/apps/64/updates-pacman.svg' "Arch Linux" "$UPDATES_PACMAN Updates"  -t 5000 &

elif [ "$UPDATES_PACMAN" -gt 0 ] && [ ! -f $notf_ON ]; then
    echo "$UPDATES_PACMAN pacman"

else
    echo
fi

while ! ping -c2 google.com > /dev/null 2>&1; do sleep 10; done

exit