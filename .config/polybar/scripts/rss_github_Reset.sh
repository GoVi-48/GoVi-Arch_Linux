#!/bin/bash

touch "$HOME/.config/polybar/scripts/Logs/Github/pass_check_entries_github"

echo "0" > "$HOME/.config/polybar/scripts/Logs/Github/rss_github"

"$HOME/.config/polybar/scripts/reload_polybar.sh"

killall -q polybar

polybar -r govi >> /tmp/polygovi.log 2>&1 &
