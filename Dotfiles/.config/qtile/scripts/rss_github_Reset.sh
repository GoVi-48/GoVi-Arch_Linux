#!/bin/bash

pgrep -x liferea || liferea &

touch "$HOME/.config/qtile/scripts/Logs/Github/pass_check_entries_github"

echo "0" > "$HOME/.config/qtile/scripts/Logs/Github/rss_github"

~/.config/qtile/scripts/rss_github.sh

~/.config/qtile/scripts/rss_github_not.sh

zenity --info --text "RSS Github Restarted" 2> /dev/null
