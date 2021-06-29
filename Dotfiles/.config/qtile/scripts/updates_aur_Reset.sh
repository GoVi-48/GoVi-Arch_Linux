#!/bin/bash

rm -f ~/.config/qtile/scripts/notf_UpdatesA
alacritty -e yay -Syua &&
qtile cmd-obj -o cmd -f restart
