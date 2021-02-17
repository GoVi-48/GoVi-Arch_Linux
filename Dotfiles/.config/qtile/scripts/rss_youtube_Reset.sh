#!/bin/bash

zenity --info --text "Reseting RSS YouTube" 2> /dev/null

pgrep -x liferea || liferea &

touch "$HOME/.config/qtile/scripts/Logs/YouTube/pass_check_entries_youtube"

echo "0" > "$HOME/.config/qtile/scripts/Logs/YouTube/rss_youtube"

~/.config/qtile/scripts/rss_youtube.sh

~/.config/qtile/scripts/rss_youtube_not.sh

zenity --info --text "RSS YouTube Restarted" 2> /dev/null
