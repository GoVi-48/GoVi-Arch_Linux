#!/bin/bash

touch "$HOME/.config/polybar/scripts/Logs/Games/check_entries_pass"

echo "0" > "$HOME/.config/polybar/scripts/Logs/Games/rss_games"

"$HOME/.config/polybar/scripts/reload_polybar.sh"