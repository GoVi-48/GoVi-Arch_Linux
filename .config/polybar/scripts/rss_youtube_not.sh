#!/bin/bash

ENTRIES=$(cat "$HOME/Scripts/Bash/Polybar/Logs/YouTube/rss_youtube_entries")

if [ "$ENTRIES" -eq 0 ]; then
    echo "%{T3}%{F#f90e39}Y%{F-}%{T-} "

else
    echo "%{T3}%{F#f90e39}Y%{F-}%{T-} $ENTRIES"
fi

