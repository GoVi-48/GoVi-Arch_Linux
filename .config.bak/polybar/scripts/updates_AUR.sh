#!/usr/bin/env bash

updates_AUR=$(yay -Qua --quiet | wc -l)

if [ $updates_AUR -eq 0 ]; then
    echo -e "\c"

else
    echo %{F#e29519}"  %{F-}$updates_AUR AUR"
fi
