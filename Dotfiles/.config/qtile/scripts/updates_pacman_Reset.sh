#!/bin/bash

alacritty -e sudo pacman -Syu &&
qtile cmd-obj -o cmd -f restart
