#!/bin/bash
 
killall -q polybar
 
~/.config/polybar/scripts/rss_games.sh
~/.config/polybar/scripts/rss_games_not.sh

~/.config/polybar/scripts/rss_github.sh
~/.config/polybar/scripts/rss_github_not.sh

~/.config/polybar/scripts/rss_youtube.sh
~/.config/polybar/scripts/rss_youtube_not.sh

 
polybar -r govi >> /tmp/polygovi.log 2>&1 &
