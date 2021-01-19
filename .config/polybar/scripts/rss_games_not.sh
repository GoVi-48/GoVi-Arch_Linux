#!/bin/bash

ENTRIES=$(cat "$HOME/Scripts/Bash/Polybar/Logs/Games/rss_games")

if [ "$ENTRIES" -eq 0 ]; then
    echo "%{T3}C%{T-}%{F-} "

else
    echo "%{T3}C%{T-}%{F-} $ENTRIES"
fi

