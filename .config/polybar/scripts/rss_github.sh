#!/bin/bash

if [ pgrep -x "*.exe" ];then
    exit
fi

LOGS="$HOME/.config/polybar/scripts/Logs/Github"

[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -f "$LOGS/rss_github" ] && echo "0" > "$LOGS/rss_github"

echo -e "\nUpdating Entries...\n"

URL_1="https://github.com/doitsujin/dxvk/releases.atom" # Dxvk
URL_2="https://github.com/FeralInteractive/gamemode/releases.atom" # Gamemode
URL_3="https://github.com/flightlessmango/MangoHud/releases.atom" # MangoHud
URL_4="https://github.com/z0z0z/mf-install/releases.atom" # MF
URL_5="https://github.com/polybar/polybar/releases.atom" # Polybar
URL_6="https://github.com/GloriousEggroll/proton-ge-custom/releases.atom" # Proton-ge-custom
URL_7="https://github.com/DadSchoorse/vkBasalt/releases.atom" # vkBasalt
URL_8="https://github.com/wine-staging/wine-staging/releases.atom" # Wine-staging
URL_9="https://github.com/Frogging-Family/wine-tkg-git/releases.atom" # Wine-tkg-git


ENTRIES_1=$(curl -s "$URL_1" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_2=$(curl -s "$URL_2" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_3=$(curl -s "$URL_3" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_4=$(curl -s "$URL_4" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_5=$(curl -s "$URL_5" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_6=$(curl -s "$URL_6" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_7=$(curl -s "$URL_7" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_8=$(curl -s "$URL_8" | awk -F "<title>|</title>" 'NF>1 {print $2}')
ENTRIES_9=$(curl -s "$URL_9" | awk -F "<title>|</title>" 'NF>1 {print $2}')


CHECK_ENTRIES() {
    echo "Dxvk:"
    echo "$ENTRIES_1" | awk 'NR==1'
    echo "$ENTRIES_1" | awk 'NR==2'
    echo "$ENTRIES_1" | awk 'NR==3'
    echo "$ENTRIES_1" | awk 'NR==4'
    echo "$ENTRIES_1" | awk 'NR==5'
    echo "$ENTRIES_1" | awk 'NR==6'
    echo "$ENTRIES_1" | awk 'NR==7'
    echo "$ENTRIES_1" | awk 'NR==8'
    echo "$ENTRIES_1" | awk 'NR==9'

    echo -e "\nGamemode:"
    echo "$ENTRIES_2" | awk 'NR==1'
    echo "$ENTRIES_2" | awk 'NR==2'
    echo "$ENTRIES_2" | awk 'NR==3'
    echo "$ENTRIES_2" | awk 'NR==4'
    echo "$ENTRIES_2" | awk 'NR==5'
    echo "$ENTRIES_2" | awk 'NR==6'
    echo "$ENTRIES_2" | awk 'NR==7'
    echo "$ENTRIES_2" | awk 'NR==8'
    echo "$ENTRIES_2" | awk 'NR==9'

    echo -e "\nMangohud:"
    echo "$ENTRIES_3" | awk 'NR==1'
    echo "$ENTRIES_3" | awk 'NR==2'
    echo "$ENTRIES_3" | awk 'NR==3'
    echo "$ENTRIES_3" | awk 'NR==4'
    echo "$ENTRIES_3" | awk 'NR==5'
    echo "$ENTRIES_3" | awk 'NR==6'
    echo "$ENTRIES_3" | awk 'NR==7'
    echo "$ENTRIES_3" | awk 'NR==8'
    echo "$ENTRIES_3" | awk 'NR==9'

    echo -e "\nMF:"
    echo "$ENTRIES_4" | awk 'NR==1'
    echo "$ENTRIES_4" | awk 'NR==2'
    echo "$ENTRIES_4" | awk 'NR==3'
    echo "$ENTRIES_4" | awk 'NR==4'
    echo "$ENTRIES_4" | awk 'NR==5'
    echo "$ENTRIES_4" | awk 'NR==6'
    echo "$ENTRIES_4" | awk 'NR==7'
    echo "$ENTRIES_4" | awk 'NR==8'
    echo "$ENTRIES_4" | awk 'NR==9'

    echo -e "\nPolybar:"
    echo "$ENTRIES_5" | awk 'NR==1'
    echo "$ENTRIES_5" | awk 'NR==2'
    echo "$ENTRIES_5" | awk 'NR==3'
    echo "$ENTRIES_5" | awk 'NR==4'
    echo "$ENTRIES_5" | awk 'NR==5'
    echo "$ENTRIES_5" | awk 'NR==6'
    echo "$ENTRIES_5" | awk 'NR==7'
    echo "$ENTRIES_5" | awk 'NR==8'
    echo "$ENTRIES_5" | awk 'NR==9'

    echo -e "\nProton-ge-custom:"
    echo "$ENTRIES_6" | awk 'NR==1'
    echo "$ENTRIES_6" | awk 'NR==2'
    echo "$ENTRIES_6" | awk 'NR==3'
    echo "$ENTRIES_6" | awk 'NR==4'
    echo "$ENTRIES_6" | awk 'NR==5'
    echo "$ENTRIES_6" | awk 'NR==6'
    echo "$ENTRIES_6" | awk 'NR==7'
    echo "$ENTRIES_6" | awk 'NR==8'
    echo "$ENTRIES_6" | awk 'NR==9'

    echo -e "\nvkBasalt:"
    echo "$ENTRIES_7" | awk 'NR==1'
    echo "$ENTRIES_7" | awk 'NR==2'
    echo "$ENTRIES_7" | awk 'NR==3'
    echo "$ENTRIES_7" | awk 'NR==4'
    echo "$ENTRIES_7" | awk 'NR==5'
    echo "$ENTRIES_7" | awk 'NR==6'
    echo "$ENTRIES_7" | awk 'NR==7'
    echo "$ENTRIES_7" | awk 'NR==8'
    echo "$ENTRIES_7" | awk 'NR==9'

    echo -e "\nWine-staging:"
    echo "$ENTRIES_8" | awk 'NR==1'
    echo "$ENTRIES_8" | awk 'NR==2'
    echo "$ENTRIES_8" | awk 'NR==3'
    echo "$ENTRIES_8" | awk 'NR==4'
    echo "$ENTRIES_8" | awk 'NR==5'
    echo "$ENTRIES_8" | awk 'NR==6'
    echo "$ENTRIES_8" | awk 'NR==7'
    echo "$ENTRIES_8" | awk 'NR==8'
    echo "$ENTRIES_8" | awk 'NR==9'

    echo -e "\nWine-tkg-git:"
    echo "$ENTRIES_9" | awk 'NR==1'
    echo "$ENTRIES_9" | awk 'NR==2'
    echo "$ENTRIES_9" | awk 'NR==3'
    echo "$ENTRIES_9" | awk 'NR==4'
    echo "$ENTRIES_9" | awk 'NR==5'
    echo "$ENTRIES_9" | awk 'NR==6'
    echo "$ENTRIES_9" | awk 'NR==7'
    echo "$ENTRIES_9" | awk 'NR==8'
    echo "$ENTRIES_9" | awk 'NR==9'
}


if [ -f "$LOGS"/pass_check_entries_github ];then
    rm -f "$LOGS"/*check_entries_github
    CHECK_ENTRIES > "$LOGS"/check_entries_github
    echo -e "\nENTRIES:============================================>\n"
    cat "$LOGS"/check_entries_github
    rm -f "$LOGS"/pass_check_entries_github
fi

if [ ! -f "$LOGS"/pass_check_entries_github ];then
    CHECK_ENTRIES > "$LOGS"/recheck_entries_github
    echo -e "\nRECHECK ENTRIES:====================================>\n"
    cat "$LOGS"/recheck_entries_github
    DIFF=$(diff -s "$LOGS"/check_entries_github "$LOGS"/recheck_entries_github)
fi

UPDATES="$(echo -e "\n$DIFF\n" | grep -c '^>')"

echo "$UPDATES" > "$LOGS"/rss_github
echo -e "\n$UPDATES Updates\n"

# crontab -e
# */5 * * * * ~/Scripts/Bash/Polybar/rss_github.sh
# crontab -l
