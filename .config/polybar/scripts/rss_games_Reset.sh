#!/bin/bash

touch "$HOME/.config/polybar/scripts/Logs/Games/pass_check_entries_games"

echo "0" > "$HOME/.config/polybar/scripts/Logs/Games/rss_games"

"$HOME/.config/polybar/scripts/reload_polybar.sh"

killall -q polybar

polybar -r govi >> /tmp/polygovi.log 2>&1 &
