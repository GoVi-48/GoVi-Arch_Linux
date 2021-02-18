#!/bin/bash

zenity --info --text "Reseting RSS Games" 2> /dev/null

pgrep -x liferea || liferea &

touch "$HOME/.config/qtile/scripts/Logs/Games/pass_check_entries_games"

echo "0" > "$HOME/.config/qtile/scripts/Logs/Games/rss_games"

~/.config/qtile/scripts/rss_games.sh

~/.config/qtile/scripts/rss_games_not.sh

zenity --info --text "RSS Games Restarted" 2> /dev/null

qtile cmd-obj -o cmd -f restart
