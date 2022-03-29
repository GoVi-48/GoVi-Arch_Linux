#!/bin/bash

pgrep -x "wineserver" > /dev/null  && exit

sudo pacman -Syy > /dev/null 2>&1

sudo yay -Syya

# crontab -e
# */40 * * * * ~/.config/qtile/scripts/system_update.sh
