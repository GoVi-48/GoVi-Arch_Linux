#!/bin/bash

ENTRIES=$(cat "$HOME/Scripts/Bash/Polybar/Logs/Games/rss_game_entries")

if [ "$ENTRIES" -eq 0 ]; then
    echo "%{T3}G%{T-}%{F-} "

else
    echo "%{T3}G%{T-}%{F-} $ENTRIES"
fi

