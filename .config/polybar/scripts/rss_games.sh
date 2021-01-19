#!/bin/bash

LOGS="$HOME/.config/polybar/scripts/Logs/Games"

[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -f "$LOGS/rss_games" ] && echo "0" > "$LOGS/rss_games"

echo -e "\nUpdating Entries...\n"

ENTRIES=$(curl -s https://www.skidrowreloaded.com/ | awk -F "<h2><a href=|</a></h2>" 'NF>1 {print $2}')

CHECK_ENTRIES() {
    echo "$ENTRIES" | awk 'NR==1'
    echo "$ENTRIES" | awk 'NR==2'
    echo "$ENTRIES" | awk 'NR==3'
    echo "$ENTRIES" | awk 'NR==5'
    echo "$ENTRIES" | awk 'NR==6'
    echo "$ENTRIES" | awk 'NR==7'
    echo "$ENTRIES" | awk 'NR==8'
    echo "$ENTRIES" | awk 'NR==9'
}


if [ -f "$LOGS"/pass_check_entries_games ]; then
    rm -f "$LOGS"/*check_entries_games
    CHECK_ENTRIES > "$LOGS"/check_entries_games
    echo -e "\nENTRIES:============================================\n"
    cat "$LOGS"/check_entries_games
    rm -f "$LOGS"/pass_check_entries_games
fi

if [ ! -f "$LOGS"/pass_check_entries_games ]; then
    CHECK_ENTRIES > "$LOGS"/recheck_entries_games
    echo -e "\nENTRIES:============================================\n"
    cat "$LOGS"/check_entries_games
    echo -e "\nRECHECK ENTRIES:====================================\n"
    cat "$LOGS"/recheck_entries_games
    DIFF=$(diff -s "$LOGS"/check_entries_games "$LOGS"/recheck_entries_games)
fi

UPDATES="$(echo -e "\n$DIFF\n" | grep -c '^>')"

echo "$UPDATES" > "$LOGS"/rss_games
echo -e "\n$UPDATES Updates\n"

# crontab -e
# */5 * * * * ~/Scripts/Bash/Polybar/rss_games.sh
# crontab -l