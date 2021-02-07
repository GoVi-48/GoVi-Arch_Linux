#!/bin/bash

ENTRIES=$(cat "$HOME/Scripts/Shell/Polybar/Logs/Games/rss_games")

if [ "$ENTRIES" -eq 0 ]; then
    echo "%{T3}C%{T-}%{F-} "

elif [ "$ENTRIES" -eq 10 ]; then
    echo "%{T3}C%{T-}%{F-} 10+"

else
    echo "%{T3}C%{T-}%{F-} $ENTRIES"
fi

