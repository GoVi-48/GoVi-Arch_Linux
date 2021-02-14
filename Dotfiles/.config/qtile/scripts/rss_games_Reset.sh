#!/bin/bash

pgrep -x liferea || liferea &

touch "$HOME/.config/qtile/scripts/Logs/Games/pass_check_entries_games"

echo "0" > "$HOME/.config/qtile/scripts/Logs/Games/rss_games"

~/.config/qtile/scripts/rss_games.sh

~/.config/qtile/scripts/rss_games_not.sh
