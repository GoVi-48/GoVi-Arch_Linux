#!/bin/bash

pgrep -x liferea || killall liferea

liferea &

touch "$HOME/.config/polybar/scripts/Logs/Github/pass_check_entries_github"

echo "0" > "$HOME/.config/polybar/scripts/Logs/Github/rss_github"

~/.config/polybar/scripts/rss_github.sh

~/.config/polybar/scripts/rss_github_not.sh

~/.config/polybar/scripts/reload_polybar.sh
