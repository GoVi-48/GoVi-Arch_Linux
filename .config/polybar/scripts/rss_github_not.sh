#!/bin/bash

ENTRIES=$(cat "$HOME/Scripts/Bash/Polybar/Logs/Github/rss_github")

if [ "$ENTRIES" -eq 0 ]; then
    echo "%{T3}G%{T-}%{F-} "

else
    echo "%{T3}G%{T-}%{F-} $ENTRIES"
fi

