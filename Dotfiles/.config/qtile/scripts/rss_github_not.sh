#!/bin/bash

ENTRIES=$(cat "$HOME/.config/qtile/scripts/Logs/Github/rss_github")

if [ "$ENTRIES" -eq 0 ]; then
    echo " "

else
    echo "$ENTRIES"
fi
