#!/bin/bash

touch "$HOME/.config/polybar/scripts/Logs/YouTube/pass_check_entries_youtube"

echo "0" > "$HOME/.config/polybar/scripts/Logs/YouTube/rss_youtube"

"$HOME/.config/polybar/scripts/reload_polybar.sh"
