#!/bin/bash

ENTRIES=$(cat "$HOME/.config/qtile/scripts/Logs/Games/rss_games")

if [ "$ENTRIES" -eq 0 ]; then
    echo " "

else
    echo "$ENTRIES"
fi

