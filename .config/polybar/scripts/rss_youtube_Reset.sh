#!/bin/bash

pgrep -x liferea || killall liferea

liferea &

touch "$HOME/.config/polybar/scripts/Logs/YouTube/pass_check_entries_youtube"

echo "0" > "$HOME/.config/polybar/scripts/Logs/YouTube/rss_youtube"

~/.config/polybar/scripts/rss_youtube.sh

~/.config/polybar/scripts/rss_youtube_not.sh

~/.config/polybar/scripts/reload_polybar.sh
