#!/bin/bash

ENTRIES=$(cat "$HOME/.config/qtile/scripts/Logs/YouTube/rss_youtube")

if [ "$ENTRIES" -eq 0 ]; then
    echo " "

else
    echo "$ENTRIES"
fi
