#!/bin/bash

[ ! -d ~/Scripts/Bash/Polybar/Logs/Games ] && mkdir -p ~/Scripts/Bash/Polybar/Logs/Games

LOGS=~/Scripts/Bash/Polybar/Logs/Games

ENTRIES=$(
    curl -s https://www.skidrowreloaded.com/ |
        sed 's|/|+|g' |
        sed -n 's/<h2>/<+h2>/p' |
        sed 's/<+h2><a href=.*">//' |
        sed 's/<+a>.*<+h2>//'
)

CHECK_ENTRIES() {
    echo "$ENTRIES" | awk 'NR==1'
    echo "$ENTRIES" | awk 'NR==2'
    echo "$ENTRIES" | awk 'NR==3'
    echo "$ENTRIES" | awk 'NR==5'
    echo "$ENTRIES" | awk 'NR==6'
    echo "$ENTRIES" | awk 'NR==7'
    echo "$ENTRIES" | awk 'NR==8'
    echo "$ENTRIES" | awk 'NR==9'
    echo -e "\n$CHECK_ENTRIES\n"
}

if [ -f "$LOGS/check_entries_pass" ]; then
    CHECK_ENTRIES | sed 's/^[[ \t]*//' > "$LOGS/check_entries"
    cat "$LOGS/check_entries"
    DIFF=$(diff -s "$LOGS/check_entries" "$LOGS/recheck_entries")
    rm -f "$LOGS/check_entries_pass"

else
    CHECK_ENTRIES | sed 's/^[[ \t]*//' > "$LOGS/recheck_entries"
    cat "$LOGS/recheck_entries"
    DIFF=$(diff -s "$LOGS/check_entries" "$LOGS/recheck_entries")
fi

UPDATES=$(echo -e "\n$DIFF\n" | grep -c '^>')

echo "$UPDATES" >  "$LOGS/rss_game_entries"

