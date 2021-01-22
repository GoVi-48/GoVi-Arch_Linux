#!/bin/bash

pgrep -x "wineserver" > /dev/null  && exit

LOGS="$HOME/.config/polybar/scripts/Logs/Games"

[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -f "$LOGS/rss_games" ] && echo "0" > "$LOGS"/rss_games

echo -e "\nUpdating Entries...\n"

CHECK_ENTRIES() {
    echo -e "\nSkidrow & Reloaded:\n$(curl -s "https://www.skidrowreloaded.com/feed/" | awk -F "<title>|</title>" '{print $2}'| sed 's/Skidrow &amp\; Reloaded Games//g' | awk 'NF')"
}


if [ -f "$LOGS"/pass_check_entries_games ];then
    rm -f "$LOGS"/*check_entries_games
    CHECK_ENTRIES > "$LOGS"/check_entries_games
    echo -e "\n<---------------------- ENTRIES ---------------------->\n"
    cat "$LOGS"/check_entries_games
    rm -f "$LOGS"/pass_check_entries_games
fi

if [ ! -f "$LOGS"/pass_check_entries_games ];then
    CHECK_ENTRIES > "$LOGS"/recheck_entries_games
    echo -e "\n<---------------------- RECHECK ENTRIES ---------------------->\n"
    cat "$LOGS"/recheck_entries_games
fi

UPDATES="$(diff -s "$LOGS"/check_entries_games "$LOGS"/recheck_entries_games)"
UPDATES_COUNT="$($UPDATES | grep -c '^>')"

echo "$UPDATES_COUNT" > "$LOGS"/rss_games
echo -e "\n$UPDATES_COUNT Updates\n"

[ "$UPDATES_COUNT" -eq 1 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES_COUNT Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES_COUNT" -eq 5 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES_COUNT Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES_COUNT" -eq 10 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES_COUNT Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES_COUNT" -eq 15 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES_COUNT Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES_COUNT" -eq 20 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES_COUNT Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"

# crontab -e
# */5 * * * * ~/.config/polybar/scripts/rss_games.sh
# crontab -l