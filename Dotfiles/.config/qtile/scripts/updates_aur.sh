#!/bin/bash

#pgrep -x "wineserver" > /dev/null  && exit

UPDATES_AUR=$(yay -Qua | wc -l)
notf_ON=~/.config/qtile/scripts/notf_ON
notf_Updates=~/.config/qtile/scripts/notf_UpdatesA

if [ "$UPDATES_AUR" -eq 0 ]; then
    echo

elif [ "$UPDATES_AUR" -gt 0 ] && [ -f $notf_ON ] && [ ! -f $notf_Updates ]; then
    echo "$UPDATES_AUR AUR"
    notify-send -i '/home/govi/Multimedia/Pictures/Icons/Themes/GoVi/apps/64/updates-AUR.svg' "Arch Linux" "Updates available"  -t 5000 &
    paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
    touch $notf_Updates

elif [ "$UPDATES_AUR" -gt 0 ] && [ -f $notf_ON ]; then
    echo "$UPDATES_AUR AUR"

elif [ "$UPDATES_AUR" -gt 1 ] && [ ! -f $notf_ON ]; then
    echo "$UPDATES_AUR AUR"

else
    echo
fi

while ! ping -c2 google.com > /dev/null 2>&1; do sleep 10; done

exit
