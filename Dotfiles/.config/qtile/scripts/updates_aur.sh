#!/bin/bash

UPDATES_AUR=$(paru -Qua | wc -l)
notf_ON=~/.config/qtile/scripts/notf_ON

if [ "$UPDATES_AUR" -eq 0 ]; then
    echo

elif [ "$UPDATES_AUR" -gt 0 ] && [ -f $notf_ON ]; then
    echo "$UPDATES_AUR AUR"
    notify-send -i '/home/govi/Multimedia/Pictures/Icons/Themes/GoVi/apps/64/updates-AUR.svg' "Arch Linux" "$UPDATES_AUR AUR Updates"  -t 5000 &
    paplay $HOME/.local/share/sounds/cause-and-effect.ogg

elif [ "$UPDATES_AUR" -gt 0 ] && [ ! -f $notf_ON ]; then
    echo "$UPDATES_AUR AUR"

else
    echo
fi

while ! ping -c2 google.com > /dev/null 2>&1; do sleep 10; done

exit
