#!/usr/bin/env bash

updates_AUR=$(yay -Qua --quiet | wc -l)

if [ $updates_AUR -eq 0 ]; then
    touch ~/.config/polybar/scripts/updates
    sleep 10
    rm -rf ~/.config/polybar/scripts/updates
    
else
    echo %{F#e29519}"  %{F-}$updates_AUR AUR"
fi
