#!/bin/bash

rm -f ~/.config/qtile/scripts/notf_UpdatesP
alacritty -e sudo pacman -Syu &&
qtile cmd-obj -o cmd -f restart
