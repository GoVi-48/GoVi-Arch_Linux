#!/bin/bash

TERMINAL="alacritty"

rm -f ~/.config/qtile/scripts/notf_UpdatesA
$TERMINAL -e  yay -Syua &&
qtile cmd-obj -o cmd -f restart
