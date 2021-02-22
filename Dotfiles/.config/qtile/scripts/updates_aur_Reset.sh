#!/bin/bash

alacritty -e paru -Syua --skipreview &&
qtile cmd-obj -o cmd -f restart
