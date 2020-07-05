#!/usr/bin/env bash

if [[ -f ~/.config/polybar/scripts/updates ]]; then
    echo -n %{F#e29519}"  "%{F-}Searching AUR
else
    echo ""
fi
