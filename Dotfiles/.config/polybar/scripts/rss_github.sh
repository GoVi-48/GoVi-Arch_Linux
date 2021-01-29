#!/bin/bash

export LANG=C.UTF-8

pgrep -x "wineserver" > /dev/null  && exit

LOGS="$HOME/.config/polybar/scripts/Logs/Github"

[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -f "$LOGS/rss_github" ] && echo "0" > "$LOGS"/rss_github

echo -e "\nUpdating Entries...\n"

CHECK_ENTRIES() {
    echo -e "\nDxvk:\n$(curl -s "https://github.com/doitsujin/dxvk/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nGamemode:\n$(curl -s "https://github.com/FeralInteractive/gamemode/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nMangohud:\n$(curl -s "https://github.com/flightlessmango/MangoHud/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nMF:\n$(curl -s "https://github.com/z0z0z/mf-install/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nPolybar:\n$(curl -s "https://github.com/polybar/polybar/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nProton-ge-custom:\n$(curl -s "https://github.com/GloriousEggroll/proton-ge-custom/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nvkBasalt:\n$(curl -s "https://github.com/DadSchoorse/vkBasalt/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nWine-staging:\n$(curl -s "https://github.com/wine-staging/wine-staging/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
    echo -e "\nWine-tkg-git:\n$(curl -s "https://github.com/Frogging-Family/wine-tkg-git/releases.atom" | awk -F "<title>|</title>" 'NF>1 {print $2}')"
}


if [ -f "${LOGS}/pass_check_entries_github" ];then
    rm -f "${LOGS}/*check_entries_github"
    CHECK_ENTRIES > "${LOGS}/check_entries_github"
    echo -e "\n<---------------------- ENTRIES ---------------------->\n"
    cat "${LOGS}/check_entries_github"
    rm -f "${LOGS}/pass_check_entries_github"
fi

if [ ! -f "${LOGS}/pass_check_entries_github" ];then
    CHECK_ENTRIES > "${LOGS}/recheck_entries_github"
    echo -e "\n<---------------------- RECHECK ENTRIES ---------------------->\n"
    cat "${LOGS}/recheck_entries_github"
fi

UPDATES="$(diff -s "${LOGS}/check_entries_github" "${LOGS}/recheck_entries_github" | grep -c '^>')"

echo "$UPDATES" > "${LOGS}/rss_github"
echo -e "\n$UPDATES Updates\n"

[ "$UPDATES" -eq 1 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES" -eq 5 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES" -eq 10 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES" -eq 15 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"
[ "$UPDATES" -eq 20 ] && kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg"

# crontab -e
# */5 * * * * ~/.config/polybar/scripts/rss_github.sh
# crontab -l
