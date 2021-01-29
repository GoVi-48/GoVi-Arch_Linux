#!/bin/bash

pgrep -x liferea || liferea &

touch "$HOME/.config/polybar/scripts/Logs/Games/pass_check_entries_games"

echo "0" > "$HOME/.config/polybar/scripts/Logs/Games/rss_games"

~/.config/polybar/scripts/rss_games.sh

~/.config/polybar/scripts/rss_games_not.sh

~/.config/polybar/scripts/reload_polybar.sh
