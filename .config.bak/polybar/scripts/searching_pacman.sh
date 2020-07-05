#!/usr/bin/env bash

if [[ -f ~/.config/polybar/scripts/updates ]]; then
    echo -n %{F#0095ff}"  "%{F-}Searching pacman
else
    echo ""
fi
