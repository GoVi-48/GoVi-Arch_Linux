#!/bin/bash

TERMINAL="alacritty"

rm -f ~/.config/qtile/scripts/notf_UpdatesP
$TERMINAL -e sudo pacman -Syu &&
qtile cmd-obj -o cmd -f restart
