#!/bin/bash

export LANG=C.UTF-8

pgrep -x "wineserver" > /dev/null  && exit

LOGS="$HOME/.config/qtile/scripts/Logs/Github"

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

if [ -f  ~/.config/qtile/scripts/notf_ON ]; then
    [ $UPDATES -eq 1 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 5 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 10 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 15 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 20 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
fi

# crontab -e
# */5 * * * * ~/.config/qtile/scripts/rss_github.sh
# crontab -l
