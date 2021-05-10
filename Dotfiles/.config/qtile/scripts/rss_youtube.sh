#!/bin/bash

export LANG=C.UTF-8

pgrep -x "wineserver" > /dev/null  && exit

LOGS="$HOME/.config/qtile/scripts/Logs/YouTube"

[ ! -d "$LOGS" ] && mkdir -p "${LOGS}/YouTube"
[ ! -f "${LOGS}/rss_youtube" ] && echo "0" > "${LOGS}/rss_youtube"

echo -e "\nUpdating Entries...\n"

L_BLUE='\033[1;34m'
NC='\033[0m'

#awk '/L_BLUE}Linux/{flag=1; next} /# END/{flag=0} flag {print}' /home/govi/Scripts/Shell/Polybar/rss_youtube.sh

CHECK_ENTRIES(){
    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                           Linux"
    echo -e "<==============================================================>${NC}"
    echo -e "\nLuke Smith:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDistrotube:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nBrodie Robertson:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nAverage Linux User:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCZiL6BoryLWxyapUuVYW27g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nJoe Collins:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCTfabOKD7Yty6sDF4POBVqA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nTechHut:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCjSEJkpGbcZhvo0lr-44X_w" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nThe Linux_Experiment:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nMental Outlaw:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nNikolay Stefanov:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCm21eK86ZmD0FQoNPGqvKlw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nOldTechBloke:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCCIHOP7e271SIumQgyl6XBQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                            Gaming"
    echo -e "<==============================================================>${NC}"
    echo -e "\n72hrs:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC8l4P6qZNLV0ApCExQrwhhA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nALIENANGE:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCzXR8qGGPRa32ZoMIzt5VSw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nBaityBait:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCNnNCBgckxzqIh1Txw5cgSg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nBCC Gaming:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCBw-Dz6wHRkxiXKCLoWqDzA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nBroadbent:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCYIznQtqvzX7th9kj9GEQDQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nel bemoldemarmol:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC2NItvpCsmSkI8LdafCh97g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nGameProTV:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXgeThZc7YiGnNkPjfaWdRQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nImKibitz:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCz9qw5nupdzCGwHwQiqs7qA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nInsertMoreCoins:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCq8n2oMl5dVugY_u4pzwoOQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nLoeya:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCARoT-xFUIxso8TDKulWSYA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nMrGrimmmz:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCNRrmKwVzQThSs2w2JpDM1A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nOh Long Johnson:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCdQdmd81Mw0Qx-GJn7ExJRw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nSl1pg8r:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCB9y6hNzccY5rTQlnI1KNqA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nthatdenverguy:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCN_kkuZ1b1emUHq2Fz3DWuQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nTortilla Squad:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC3C9dOKpyemQCCJqsYt3ySQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nVerox Pivigames:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC7NO1-kIHv6vJTwuKxTNhmA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                            Gaming-Retro"
    echo -e "<==============================================================>${NC}"
    echo -e "\nArcade Punks:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCT7P9WXh0wdYY-gRsdJoARg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nAV TV:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCOLGDbv1I-BBSK-ZnTi4G0A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nBSoD Gaming:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCex2B-k-ZIJhcjRdlYUz4MQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDrewTalks:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCJKXXWD2VtMNjLVvyRv4X1Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nEl Hendri:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCEsRJvL_BDmK1faQH5mjNLg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nHarrison Hacks:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCZ4lyVmGC3yfJl1skgdGYvg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nJG Kings06:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCuUu-Ea-F0FJDjQ-LXADQuw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nSimply Austin:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCb4RFFBZEztOW77onViqoDA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                           Media"
    echo -e "<==============================================================>${NC}"
    echo -e "\nCyberdogStudios:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCoUpWZ9EKz-F_wK8nMfxpow" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDiamond Build:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCkX6dQihoolp88g4AEzxtng" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDimitrology:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUY5BYXIaZoa4-HclwnNWDA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nFreeworld.Media:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCrS-4eNHy0t5Ud_IDipurmg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nPeter Carcione:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCQZcmkkx7hc0ik4wjaAtINQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                           Mistery"
    echo -e "<==============================================================>${NC}"
    echo -e "\nAndrea Alerta:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXoXljexfCDZLj4SrrD6Q1w" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nANGEL RUIZ OJEDA:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCd6oFPuWw825Aw_gV_Xa21g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nCanal de Roly Polanco:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUbg4D2kdClf34xu7F2kG9Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nCosmic Consciousness with Jonas:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC6bmn-6O0s0-F7rNH6Xx07A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDavidParcerisaLive:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC_p3X5yMGs_LvtGTU-1ZsAQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nEl Nuevo Amanecer:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCxwWUF4NiXO6KZlQD0zcu2g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nEl Relleno Misterios:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCX-F2q3iv0rK7e7W59kThZg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nJaconor 73:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCM0AdqMFG8_TSL7MJy--RCA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nJC Gigamisterios:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCQ3zNtUFa8nSG1Tncsr-cWQ"| awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nLuciernaga1962:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC4Vm2JlEwPZmfbwPD13O5sw"  | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nMartin Laplace:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCw5x89dM0RQTR3gd8bm0zhQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nNaturnia:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCqtBRc_K5jSiA4ssdWGbzdg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\n Open Your Reality:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCdL0EBS5U8-rJ4YQlxGmeBg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nPonencias Zen:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC00t8KjOTEG5E1_lIwjG7hg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nQuantum Gravity Research:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUyk0KLo7JPLCCh4oRNLzsQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nRIMBEL35:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCmdvAxEJ14EvXdASKbodj1Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nTeal Swan:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC1KIUp4PNCyIwCPTq1hYzWQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nUNSALTOQUANTICO:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCQqcW6kDv64Rd-xCKQ8mc8g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nVerdad Oculta:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCALE1jdtTAmgzyyH4FMU5pQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nVm granmisterio:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCcbUuPjp7J32YSIESrUe76A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                           Sports"
    echo -e "<==============================================================>${NC}"
    echo -e "\nDerek Hameister:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCWxA3FTwLeObRKp-gf7CAIQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDevon Larratt:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCBcMvaSRmSh3362bzvOBerw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nGreen Fits:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCvOoVW1ghB0Nxt2duEBGJKw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nhugo van damme:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC3h8ePFDw-WXLxH3vbAWP-g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nProfessor Live:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC5zJwsFtEs9WYe3A76p7xIA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                           Tech"
    echo -e "<==============================================================>${NC}"
    echo -e "\nEF - Tech Made Simple:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCX_WM2O-X96URC5n66G-hvw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nExplainingComputers:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCbiGcwDWZjz05njNPrJU7jA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nLinus Tech Tips:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nMajor Hardware:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUXW4gT27TOaDzKFyN-1tXQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nMis Movidas:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUCaxgQae2XgmlMz9QzQr7Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nNate Gentile:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC36xmz34q02JYaZYKrMwXng" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nOptimum Tech:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCRYOj4DmyxhBVrdvbsUwmAA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nStuff Made Here:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCj1VqrHhDte54oLgPG4xpuQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                           Tutorials"
    echo -e "<==============================================================>${NC}"
    echo -e "\nCorey Schafer:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCCezIgC97PvUuR4_gbFUs5g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nFalconMasters:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCJl1YajcPWTeJNsQhGyMIMg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END

    echo -e "\n${L_BLUE}<==============================================================>"
    echo -e "                           Other"
    echo -e "<==============================================================>${NC}"
    echo -e "\nDIEGO MEXIV3RG4S:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCfqTcJv-3I9xTLXJWXM_JVg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDIY Perks:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUQo7nzH1sXVpzL92VesANw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nDrossRotzank:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCNYW2vfGrUE6R5mIJYzkRyQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nSeries y Mas:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCscuAsbMkIKJmqwmAMa1ezw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nMarihuana Televisión:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC59w0wPqfAcCyyi_rnazw4Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nVeritasium en español:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXtxgWwk55kVJo9lCCZRdmg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    echo -e "\nViction:\n$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCWWKyYvy-FdTTANGX_Hujig" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')"
    # END
}


if [ -f "${LOGS}/pass_check_entries_youtube" ];then
    rm -f "${LOGS}/*check_entries_youtube"
    CHECK_ENTRIES > "${LOGS}/check_entries_youtube"
    echo -e "\n<---------------------- ENTRIES ---------------------->\n"
    cat "${LOGS}/check_entries_youtube"
    rm -f "${LOGS}/pass_check_entries_youtube"
fi

if [ ! -f "${LOGS}/pass_check_entries_youtube" ];then
    CHECK_ENTRIES > "${LOGS}/recheck_entries_youtube"
    echo -e "\n<---------------------- RECHECK ENTRIES ---------------------->\n"
    cat "${LOGS}/recheck_entries_youtube"
fi

UPDATES="$(diff -s "${LOGS}/check_entries_youtube" "${LOGS}/recheck_entries_youtube" | grep -c '^>')"

echo "$UPDATES" > "${LOGS}/rss_youtube"
echo -e "\n$UPDATES Updates\n"

if [ -f  ~/.config/qtile/scripts/notf_ON ]; then
    [ $UPDATES -eq 1 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 5 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 10 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 15 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    [ $UPDATES -eq 20 ] && zenity --info --text "$UPDATES Updates" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg
fi

# crontab -e
# */5 * * * * ~/.config/qtile/scripts/rss_youtube.sh
# crontab -l