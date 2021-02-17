#!/bin/bash

UPDATES_AUR=$(paru -Qua | wc -l)
notf_ON=~/.config/qtile/scripts/notf_ON

if [ "$UPDATES_AUR" -eq 0 ]; then
    echo

elif [ "$UPDATES_AUR" -gt 0 ] && [ -f $notf_ON ]; then
    echo "$UPDATES_AUR AUR"
    zenity --info --text "$UPDATES_AUR AUR Updates" 2> /dev/null &
    paplay $HOME/.local/share/sounds/long-dang.ogg

elif [ "$UPDATES_AUR" -gt 0 ] && [ ! -f $notf_ON ]; then
    echo "$UPDATES_AUR AUR"

else
    echo
fi

while ! ping -c2 google.com > /dev/null 2>&1; do sleep 10; done
