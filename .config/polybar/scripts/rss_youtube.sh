#!/usr/bin/env bash

LOGS="$HOME/.config/polybar/scripts/Logs/YouTube"

[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -f "$LOGS/rss_youtube" ] && echo "0" > "$LOGS/rss_youtube"

echo -e "\nUpdating Entries...\n"

#Linux
URL_1="https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" # Luke Smith
URL_2="https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg" # Distrotube
URL_3="https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA" # Brodie Robertson
URL_4="https://www.youtube.com/feeds/videos.xml?channel_id=UCZiL6BoryLWxyapUuVYW27g" # Average Linux User
URL_5="https://www.youtube.com/feeds/videos.xml?channel_id=UCTfabOKD7Yty6sDF4POBVqA" # Joe Collins
URL_6="https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw" # The Linux Experiment
URL_7="https://www.youtube.com/feeds/videos.xml?channel_id=UCm21eK86ZmD0FQoNPGqvKlw" # Nikolay Stefanov
URL_8="https://www.youtube.com/feeds/videos.xml?channel_id=UCCIHOP7e271SIumQgyl6XBQ" # OldTechBloke
URL_9="https://www.youtube.com/feeds/videos.xml?channel_id=UCg6gPGh8HU2U01vaFCAsvmQ" # Chris Titus Tech
URL_10="https://www.youtube.com/feeds/videos.xml?channel_id=UCtYg149E_wUGVmjGz-TgyNA" # Titus Tech Talk

# Gaming
URL_11="https://www.youtube.com/feeds/videos.xml?channel_id=UC8l4P6qZNLV0ApCExQrwhhA" # 72hrs
URL_12="https://www.youtube.com/feeds/videos.xml?channel_id=UCzXR8qGGPRa32ZoMIzt5VSw" # ALIENANGE
URL_13="https://www.youtube.com/feeds/videos.xml?channel_id=UCBw-Dz6wHRkxiXKCLoWqDzA" # BCC Gaming
URL_14="https://www.youtube.com/feeds/videos.xml?channel_id=UC2NItvpCsmSkI8LdafCh97g" # el bemoldemarmol"
URL_15="https://www.youtube.com/feeds/videos.xml?channel_id=UCXgeThZc7YiGnNkPjfaWdRQ" # GameProTV
URL_16="https://www.youtube.com/feeds/videos.xml?channel_id=UCKy1dAqELo0zrOtPkf0eTMw" # IGN
URL_17="https://www.youtube.com/feeds/videos.xml?channel_id=UCz9qw5nupdzCGwHwQiqs7qA" # ImKibitz
URL_18="https://www.youtube.com/feeds/videos.xml?channel_id=UCq8n2oMl5dVugY_u4pzwoOQ" # InsertMoreCoins
URL_19="https://www.youtube.com/feeds/videos.xml?channel_id=UCtSKdz7X4QhaL6LgyOhCViQ" # j0hnbane
URL_20="https://www.youtube.com/feeds/videos.xml?channel_id=UCkNYoWK1LqjFhxYI6BM_kOA" # Lethamyr
URL_21="https://www.youtube.com/feeds/videos.xml?channel_id=UCdT4cnyWOh6sDXivyqLURHQ" # Linkuru
URL_22="https://www.youtube.com/feeds/videos.xml?channel_id=UCARoT-xFUIxso8TDKulWSYA" # Loeya
URL_23="https://www.youtube.com/feeds/videos.xml?channel_id=UCNRrmKwVzQThSs2w2JpDM1A" # MrGrimmmz
URL_24="https://www.youtube.com/feeds/videos.xml?channel_id=UCdQdmd81Mw0Qx-GJn7ExJRw" # Oh Long Johnson
URL_25="https://www.youtube.com/feeds/videos.xml?channel_id=UCLdrFLVHsqyLt2Z6lQmf5cQ" # Rosdri
URL_26="https://www.youtube.com/feeds/videos.xml?channel_id=UCB9y6hNzccY5rTQlnI1KNqA" # Sl1pg8r - Daily Stuff and Things!
URL_27="https://www.youtube.com/feeds/videos.xml?channel_id=UCocHtA1ADT6kTObipYzJoww" # SunlessKhan
URL_28="https://www.youtube.com/feeds/videos.xml?channel_id=UCN_kkuZ1b1emUHq2Fz3DWuQ" # thatdenverguy
URL_29="https://www.youtube.com/feeds/videos.xml?channel_id=UC3C9dOKpyemQCCJqsYt3ySQ" # Tortilla Squad
URL_30="https://www.youtube.com/feeds/videos.xml?channel_id=UC7NO1-kIHv6vJTwuKxTNhmA" # Verox Pivigames
URL_31="https://www.youtube.com/feeds/videos.xml?channel_id=UC3cbD8JQJtHSCKVVN_hu1kA" # WASDCommunity

# Gaming - Retro
URL_32="https://www.youtube.com/feeds/videos.xml?channel_id=UCT7P9WXh0wdYY-gRsdJoARg" # Arcade Punks
URL_33="https://www.youtube.com/feeds/videos.xml?channel_id=UCOLGDbv1I-BBSK-ZnTi4G0A" # AV TV
URL_34="https://www.youtube.com/feeds/videos.xml?channel_id=UCex2B-k-ZIJhcjRdlYUz4MQ" # BSoD Gaming
URL_35="https://www.youtube.com/feeds/videos.xml?channel_id=UCJKXXWD2VtMNjLVvyRv4X1Q" # DrewTalks
URL_36="https://www.youtube.com/feeds/videos.xml?channel_id=UCEsRJvL_BDmK1faQH5mjNLg" # El Hendri
URL_37="https://www.youtube.com/feeds/videos.xml?channel_id=UCZ4lyVmGC3yfJl1skgdGYvg" # Harrison Hacks
URL_38="https://www.youtube.com/feeds/videos.xml?channel_id=UCuUu-Ea-F0FJDjQ-LXADQuw" # JG Kings06
URL_39="https://www.youtube.com/feeds/videos.xml?channel_id=UCb4RFFBZEztOW77onViqoDA" # Simply Austin


ENTRIES_1=$(curl -s "$URL_1" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_2=$(curl -s "$URL_2" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_3=$(curl -s "$URL_3" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_4=$(curl -s "$URL_4" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_5=$(curl -s "$URL_5" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_6=$(curl -s "$URL_6" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_7=$(curl -s "$URL_7" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_8=$(curl -s "$URL_8" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_9=$(curl -s "$URL_9" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_10=$(curl -s "$URL_10" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_11=$(curl -s "$URL_11" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_12=$(curl -s "$URL_12" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_13=$(curl -s "$URL_13" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_14=$(curl -s "$URL_14" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_15=$(curl -s "$URL_15" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_16=$(curl -s "$URL_16" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_17=$(curl -s "$URL_17" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_18=$(curl -s "$URL_18" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_19=$(curl -s "$URL_19" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_20=$(curl -s "$URL_20" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_21=$(curl -s "$URL_21" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_22=$(curl -s "$URL_22" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_23=$(curl -s "$URL_23" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_24=$(curl -s "$URL_24" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_25=$(curl -s "$URL_25" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_26=$(curl -s "$URL_26" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_27=$(curl -s "$URL_27" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_28=$(curl -s "$URL_28" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_29=$(curl -s "$URL_29" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_30=$(curl -s "$URL_30" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_31=$(curl -s "$URL_31" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_32=$(curl -s "$URL_32" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_33=$(curl -s "$URL_33" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_34=$(curl -s "$URL_34" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_35=$(curl -s "$URL_35" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_36=$(curl -s "$URL_36" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_37=$(curl -s "$URL_37" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_38=$(curl -s "$URL_38" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')
ENTRIES_39=$(curl -s "$URL_39" | sed -n 's/<media:title>/<\/media:title>/p' | sed 's/<\/media:title>//g' | sed 's/^[ \t]*//')


CHECK_ENTRIES(){
    echo "$ENTRIES_1" | awk 'NR==1'
    echo "$ENTRIES_1" | awk 'NR==2'
    echo "$ENTRIES_1" | awk 'NR==3'
    echo "$ENTRIES_1" | awk 'NR==4'
    echo "$ENTRIES_1" | awk 'NR==5'
    echo "$ENTRIES_1" | awk 'NR==6'
    echo "$ENTRIES_1" | awk 'NR==7'
    echo "$ENTRIES_1" | awk 'NR==8'
    echo "$ENTRIES_1" | awk 'NR==9'

    echo "$ENTRIES_2" | awk 'NR==1'
    echo "$ENTRIES_2" | awk 'NR==2'
    echo "$ENTRIES_2" | awk 'NR==3'
    echo "$ENTRIES_2" | awk 'NR==4'
    echo "$ENTRIES_2" | awk 'NR==5'
    echo "$ENTRIES_2" | awk 'NR==6'
    echo "$ENTRIES_2" | awk 'NR==7'
    echo "$ENTRIES_2" | awk 'NR==8'
    echo "$ENTRIES_2" | awk 'NR==9'

    echo "$ENTRIES_3" | awk 'NR==1'
    echo "$ENTRIES_3" | awk 'NR==2'
    echo "$ENTRIES_3" | awk 'NR==3'
    echo "$ENTRIES_3" | awk 'NR==4'
    echo "$ENTRIES_3" | awk 'NR==5'
    echo "$ENTRIES_3" | awk 'NR==6'
    echo "$ENTRIES_3" | awk 'NR==7'
    echo "$ENTRIES_3" | awk 'NR==8'
    echo "$ENTRIES_3" | awk 'NR==9'

    echo "$ENTRIES_4" | awk 'NR==1'
    echo "$ENTRIES_4" | awk 'NR==2'
    echo "$ENTRIES_4" | awk 'NR==3'
    echo "$ENTRIES_4" | awk 'NR==4'
    echo "$ENTRIES_4" | awk 'NR==5'
    echo "$ENTRIES_4" | awk 'NR==6'
    echo "$ENTRIES_4" | awk 'NR==7'
    echo "$ENTRIES_4" | awk 'NR==8'
    echo "$ENTRIES_4" | awk 'NR==9'

    echo "$ENTRIES_5" | awk 'NR==1'
    echo "$ENTRIES_5" | awk 'NR==2'
    echo "$ENTRIES_5" | awk 'NR==3'
    echo "$ENTRIES_5" | awk 'NR==4'
    echo "$ENTRIES_5" | awk 'NR==5'
    echo "$ENTRIES_5" | awk 'NR==6'
    echo "$ENTRIES_5" | awk 'NR==7'
    echo "$ENTRIES_5" | awk 'NR==8'
    echo "$ENTRIES_5" | awk 'NR==9'

    echo "$ENTRIES_6" | awk 'NR==1'
    echo "$ENTRIES_6" | awk 'NR==2'
    echo "$ENTRIES_6" | awk 'NR==3'
    echo "$ENTRIES_6" | awk 'NR==4'
    echo "$ENTRIES_6" | awk 'NR==5'
    echo "$ENTRIES_6" | awk 'NR==6'
    echo "$ENTRIES_6" | awk 'NR==7'
    echo "$ENTRIES_6" | awk 'NR==8'
    echo "$ENTRIES_6" | awk 'NR==9'

    echo "$ENTRIES_7" | awk 'NR==1'
    echo "$ENTRIES_7" | awk 'NR==2'
    echo "$ENTRIES_7" | awk 'NR==3'
    echo "$ENTRIES_7" | awk 'NR==4'
    echo "$ENTRIES_7" | awk 'NR==5'
    echo "$ENTRIES_7" | awk 'NR==6'
    echo "$ENTRIES_7" | awk 'NR==7'
    echo "$ENTRIES_7" | awk 'NR==8'
    echo "$ENTRIES_7" | awk 'NR==9'

    echo "$ENTRIES_8" | awk 'NR==1'
    echo "$ENTRIES_8" | awk 'NR==2'
    echo "$ENTRIES_8" | awk 'NR==3'
    echo "$ENTRIES_8" | awk 'NR==4'
    echo "$ENTRIES_8" | awk 'NR==5'
    echo "$ENTRIES_8" | awk 'NR==6'
    echo "$ENTRIES_8" | awk 'NR==7'
    echo "$ENTRIES_8" | awk 'NR==8'
    echo "$ENTRIES_8" | awk 'NR==9'

    echo "$ENTRIES_9" | awk 'NR==1'
    echo "$ENTRIES_9" | awk 'NR==2'
    echo "$ENTRIES_9" | awk 'NR==3'
    echo "$ENTRIES_9" | awk 'NR==4'
    echo "$ENTRIES_9" | awk 'NR==5'
    echo "$ENTRIES_9" | awk 'NR==6'
    echo "$ENTRIES_9" | awk 'NR==7'
    echo "$ENTRIES_9" | awk 'NR==8'
    echo "$ENTRIES_9" | awk 'NR==9'

    echo "$ENTRIES_10" | awk 'NR==1'
    echo "$ENTRIES_10" | awk 'NR==2'
    echo "$ENTRIES_10" | awk 'NR==3'
    echo "$ENTRIES_10" | awk 'NR==4'
    echo "$ENTRIES_10" | awk 'NR==5'
    echo "$ENTRIES_10" | awk 'NR==6'
    echo "$ENTRIES_10" | awk 'NR==7'
    echo "$ENTRIES_10" | awk 'NR==8'
    echo "$ENTRIES_10" | awk 'NR==9'

    echo "$ENTRIES_11" | awk 'NR==1'
    echo "$ENTRIES_11" | awk 'NR==2'
    echo "$ENTRIES_11" | awk 'NR==3'
    echo "$ENTRIES_11" | awk 'NR==4'
    echo "$ENTRIES_11" | awk 'NR==5'
    echo "$ENTRIES_11" | awk 'NR==6'
    echo "$ENTRIES_11" | awk 'NR==7'
    echo "$ENTRIES_11" | awk 'NR==8'
    echo "$ENTRIES_11" | awk 'NR==9'

    echo "$ENTRIES_12" | awk 'NR==1'
    echo "$ENTRIES_12" | awk 'NR==2'
    echo "$ENTRIES_12" | awk 'NR==3'
    echo "$ENTRIES_12" | awk 'NR==4'
    echo "$ENTRIES_12" | awk 'NR==5'
    echo "$ENTRIES_12" | awk 'NR==6'
    echo "$ENTRIES_12" | awk 'NR==7'
    echo "$ENTRIES_12" | awk 'NR==8'
    echo "$ENTRIES_12" | awk 'NR==9'

    echo "$ENTRIES_13" | awk 'NR==1'
    echo "$ENTRIES_13" | awk 'NR==2'
    echo "$ENTRIES_13" | awk 'NR==3'
    echo "$ENTRIES_13" | awk 'NR==4'
    echo "$ENTRIES_13" | awk 'NR==5'
    echo "$ENTRIES_13" | awk 'NR==6'
    echo "$ENTRIES_13" | awk 'NR==7'
    echo "$ENTRIES_13" | awk 'NR==8'
    echo "$ENTRIES_13" | awk 'NR==9'

    echo "$ENTRIES_14" | awk 'NR==1'
    echo "$ENTRIES_14" | awk 'NR==2'
    echo "$ENTRIES_14" | awk 'NR==3'
    echo "$ENTRIES_14" | awk 'NR==4'
    echo "$ENTRIES_14" | awk 'NR==5'
    echo "$ENTRIES_14" | awk 'NR==6'
    echo "$ENTRIES_14" | awk 'NR==7'
    echo "$ENTRIES_14" | awk 'NR==8'
    echo "$ENTRIES_14" | awk 'NR==9'

    echo "$ENTRIES_15" | awk 'NR==1'
    echo "$ENTRIES_15" | awk 'NR==2'
    echo "$ENTRIES_15" | awk 'NR==3'
    echo "$ENTRIES_15" | awk 'NR==4'
    echo "$ENTRIES_15" | awk 'NR==5'
    echo "$ENTRIES_15" | awk 'NR==6'
    echo "$ENTRIES_15" | awk 'NR==7'
    echo "$ENTRIES_15" | awk 'NR==8'
    echo "$ENTRIES_15" | awk 'NR==9'

    echo "$ENTRIES_16" | awk 'NR==1'
    echo "$ENTRIES_16" | awk 'NR==2'
    echo "$ENTRIES_16" | awk 'NR==3'
    echo "$ENTRIES_16" | awk 'NR==4'
    echo "$ENTRIES_16" | awk 'NR==5'
    echo "$ENTRIES_16" | awk 'NR==6'
    echo "$ENTRIES_16" | awk 'NR==7'
    echo "$ENTRIES_16" | awk 'NR==8'
    echo "$ENTRIES_16" | awk 'NR==9'

    echo "$ENTRIES_17" | awk 'NR==1'
    echo "$ENTRIES_17" | awk 'NR==2'
    echo "$ENTRIES_17" | awk 'NR==3'
    echo "$ENTRIES_17" | awk 'NR==4'
    echo "$ENTRIES_17" | awk 'NR==5'
    echo "$ENTRIES_17" | awk 'NR==6'
    echo "$ENTRIES_17" | awk 'NR==7'
    echo "$ENTRIES_17" | awk 'NR==8'
    echo "$ENTRIES_17" | awk 'NR==9'

    echo "$ENTRIES_18" | awk 'NR==1'
    echo "$ENTRIES_18" | awk 'NR==2'
    echo "$ENTRIES_18" | awk 'NR==3'
    echo "$ENTRIES_18" | awk 'NR==4'
    echo "$ENTRIES_18" | awk 'NR==5'
    echo "$ENTRIES_18" | awk 'NR==6'
    echo "$ENTRIES_18" | awk 'NR==7'
    echo "$ENTRIES_18" | awk 'NR==8'
    echo "$ENTRIES_18" | awk 'NR==9'

    echo "$ENTRIES_19" | awk 'NR==1'
    echo "$ENTRIES_19" | awk 'NR==2'
    echo "$ENTRIES_19" | awk 'NR==3'
    echo "$ENTRIES_19" | awk 'NR==4'
    echo "$ENTRIES_19" | awk 'NR==5'
    echo "$ENTRIES_19" | awk 'NR==6'
    echo "$ENTRIES_19" | awk 'NR==7'
    echo "$ENTRIES_19" | awk 'NR==8'
    echo "$ENTRIES_19" | awk 'NR==9'

    echo "$ENTRIES_20" | awk 'NR==1'
    echo "$ENTRIES_20" | awk 'NR==2'
    echo "$ENTRIES_20" | awk 'NR==3'
    echo "$ENTRIES_20" | awk 'NR==4'
    echo "$ENTRIES_20" | awk 'NR==5'
    echo "$ENTRIES_20" | awk 'NR==6'
    echo "$ENTRIES_20" | awk 'NR==7'
    echo "$ENTRIES_20" | awk 'NR==8'
    echo "$ENTRIES_20" | awk 'NR==9'

    echo "$ENTRIES_21" | awk 'NR==1'
    echo "$ENTRIES_21" | awk 'NR==2'
    echo "$ENTRIES_21" | awk 'NR==3'
    echo "$ENTRIES_21" | awk 'NR==4'
    echo "$ENTRIES_21" | awk 'NR==5'
    echo "$ENTRIES_21" | awk 'NR==6'
    echo "$ENTRIES_21" | awk 'NR==7'
    echo "$ENTRIES_21" | awk 'NR==8'
    echo "$ENTRIES_21" | awk 'NR==9'

    echo "$ENTRIES_22" | awk 'NR==1'
    echo "$ENTRIES_22" | awk 'NR==2'
    echo "$ENTRIES_22" | awk 'NR==3'
    echo "$ENTRIES_22" | awk 'NR==4'
    echo "$ENTRIES_22" | awk 'NR==5'
    echo "$ENTRIES_22" | awk 'NR==6'
    echo "$ENTRIES_22" | awk 'NR==7'
    echo "$ENTRIES_22" | awk 'NR==8'
    echo "$ENTRIES_22" | awk 'NR==9'

    echo "$ENTRIES_23" | awk 'NR==1'
    echo "$ENTRIES_23" | awk 'NR==2'
    echo "$ENTRIES_23" | awk 'NR==3'
    echo "$ENTRIES_23" | awk 'NR==4'
    echo "$ENTRIES_23" | awk 'NR==5'
    echo "$ENTRIES_23" | awk 'NR==6'
    echo "$ENTRIES_23" | awk 'NR==7'
    echo "$ENTRIES_23" | awk 'NR==8'
    echo "$ENTRIES_23" | awk 'NR==9'

    echo "$ENTRIES_24" | awk 'NR==1'
    echo "$ENTRIES_24" | awk 'NR==2'
    echo "$ENTRIES_24" | awk 'NR==3'
    echo "$ENTRIES_24" | awk 'NR==4'
    echo "$ENTRIES_24" | awk 'NR==5'
    echo "$ENTRIES_24" | awk 'NR==6'
    echo "$ENTRIES_24" | awk 'NR==7'
    echo "$ENTRIES_24" | awk 'NR==8'
    echo "$ENTRIES_24" | awk 'NR==9'

    echo "$ENTRIES_25" | awk 'NR==1'
    echo "$ENTRIES_25" | awk 'NR==2'
    echo "$ENTRIES_25" | awk 'NR==3'
    echo "$ENTRIES_25" | awk 'NR==4'
    echo "$ENTRIES_25" | awk 'NR==5'
    echo "$ENTRIES_25" | awk 'NR==6'
    echo "$ENTRIES_25" | awk 'NR==7'
    echo "$ENTRIES_25" | awk 'NR==8'
    echo "$ENTRIES_25" | awk 'NR==9'

    echo "$ENTRIES_26" | awk 'NR==1'
    echo "$ENTRIES_26" | awk 'NR==2'
    echo "$ENTRIES_26" | awk 'NR==3'
    echo "$ENTRIES_26" | awk 'NR==4'
    echo "$ENTRIES_26" | awk 'NR==5'
    echo "$ENTRIES_26" | awk 'NR==6'
    echo "$ENTRIES_26" | awk 'NR==7'
    echo "$ENTRIES_26" | awk 'NR==8'
    echo "$ENTRIES_26" | awk 'NR==9'

    echo "$ENTRIES_27" | awk 'NR==1'
    echo "$ENTRIES_27" | awk 'NR==2'
    echo "$ENTRIES_27" | awk 'NR==3'
    echo "$ENTRIES_27" | awk 'NR==4'
    echo "$ENTRIES_27" | awk 'NR==5'
    echo "$ENTRIES_27" | awk 'NR==6'
    echo "$ENTRIES_27" | awk 'NR==7'
    echo "$ENTRIES_27" | awk 'NR==8'
    echo "$ENTRIES_27" | awk 'NR==9'

    echo "$ENTRIES_28" | awk 'NR==1'
    echo "$ENTRIES_28" | awk 'NR==2'
    echo "$ENTRIES_28" | awk 'NR==3'
    echo "$ENTRIES_28" | awk 'NR==4'
    echo "$ENTRIES_28" | awk 'NR==5'
    echo "$ENTRIES_28" | awk 'NR==6'
    echo "$ENTRIES_28" | awk 'NR==7'
    echo "$ENTRIES_28" | awk 'NR==8'
    echo "$ENTRIES_28" | awk 'NR==9'

    echo "$ENTRIES_29" | awk 'NR==1'
    echo "$ENTRIES_29" | awk 'NR==2'
    echo "$ENTRIES_29" | awk 'NR==3'
    echo "$ENTRIES_29" | awk 'NR==4'
    echo "$ENTRIES_29" | awk 'NR==5'
    echo "$ENTRIES_29" | awk 'NR==6'
    echo "$ENTRIES_29" | awk 'NR==7'
    echo "$ENTRIES_29" | awk 'NR==8'
    echo "$ENTRIES_29" | awk 'NR==9'

    echo "$ENTRIES_30" | awk 'NR==1'
    echo "$ENTRIES_30" | awk 'NR==2'
    echo "$ENTRIES_30" | awk 'NR==3'
    echo "$ENTRIES_30" | awk 'NR==4'
    echo "$ENTRIES_30" | awk 'NR==5'
    echo "$ENTRIES_30" | awk 'NR==6'
    echo "$ENTRIES_30" | awk 'NR==7'
    echo "$ENTRIES_30" | awk 'NR==8'
    echo "$ENTRIES_30" | awk 'NR==9'

    echo "$ENTRIES_31" | awk 'NR==1'
    echo "$ENTRIES_31" | awk 'NR==2'
    echo "$ENTRIES_31" | awk 'NR==3'
    echo "$ENTRIES_31" | awk 'NR==4'
    echo "$ENTRIES_31" | awk 'NR==5'
    echo "$ENTRIES_31" | awk 'NR==6'
    echo "$ENTRIES_31" | awk 'NR==7'
    echo "$ENTRIES_31" | awk 'NR==8'
    echo "$ENTRIES_31" | awk 'NR==9'

    echo "$ENTRIES_32" | awk 'NR==1'
    echo "$ENTRIES_32" | awk 'NR==2'
    echo "$ENTRIES_32" | awk 'NR==3'
    echo "$ENTRIES_32" | awk 'NR==4'
    echo "$ENTRIES_32" | awk 'NR==5'
    echo "$ENTRIES_32" | awk 'NR==6'
    echo "$ENTRIES_32" | awk 'NR==7'
    echo "$ENTRIES_32" | awk 'NR==8'
    echo "$ENTRIES_32" | awk 'NR==9'

    echo "$ENTRIES_33" | awk 'NR==1'
    echo "$ENTRIES_33" | awk 'NR==2'
    echo "$ENTRIES_33" | awk 'NR==3'
    echo "$ENTRIES_33" | awk 'NR==4'
    echo "$ENTRIES_33" | awk 'NR==5'
    echo "$ENTRIES_33" | awk 'NR==6'
    echo "$ENTRIES_33" | awk 'NR==7'
    echo "$ENTRIES_33" | awk 'NR==8'
    echo "$ENTRIES_33" | awk 'NR==9'

    echo "$ENTRIES_34" | awk 'NR==1'
    echo "$ENTRIES_34" | awk 'NR==2'
    echo "$ENTRIES_34" | awk 'NR==3'
    echo "$ENTRIES_34" | awk 'NR==4'
    echo "$ENTRIES_34" | awk 'NR==5'
    echo "$ENTRIES_34" | awk 'NR==6'
    echo "$ENTRIES_34" | awk 'NR==7'
    echo "$ENTRIES_34" | awk 'NR==8'
    echo "$ENTRIES_34" | awk 'NR==9'

    echo "$ENTRIES_35" | awk 'NR==1'
    echo "$ENTRIES_35" | awk 'NR==2'
    echo "$ENTRIES_35" | awk 'NR==3'
    echo "$ENTRIES_35" | awk 'NR==4'
    echo "$ENTRIES_35" | awk 'NR==5'
    echo "$ENTRIES_35" | awk 'NR==6'
    echo "$ENTRIES_35" | awk 'NR==7'
    echo "$ENTRIES_35" | awk 'NR==8'
    echo "$ENTRIES_35" | awk 'NR==9'

    echo "$ENTRIES_36" | awk 'NR==1'
    echo "$ENTRIES_36" | awk 'NR==2'
    echo "$ENTRIES_36" | awk 'NR==3'
    echo "$ENTRIES_36" | awk 'NR==4'
    echo "$ENTRIES_36" | awk 'NR==5'
    echo "$ENTRIES_36" | awk 'NR==6'
    echo "$ENTRIES_36" | awk 'NR==7'
    echo "$ENTRIES_36" | awk 'NR==8'
    echo "$ENTRIES_36" | awk 'NR==9'

    echo "$ENTRIES_37" | awk 'NR==1'
    echo "$ENTRIES_37" | awk 'NR==2'
    echo "$ENTRIES_37" | awk 'NR==3'
    echo "$ENTRIES_37" | awk 'NR==4'
    echo "$ENTRIES_37" | awk 'NR==5'
    echo "$ENTRIES_37" | awk 'NR==6'
    echo "$ENTRIES_37" | awk 'NR==7'
    echo "$ENTRIES_37" | awk 'NR==8'
    echo "$ENTRIES_37" | awk 'NR==9'

    echo "$ENTRIES_38" | awk 'NR==1'
    echo "$ENTRIES_38" | awk 'NR==2'
    echo "$ENTRIES_38" | awk 'NR==3'
    echo "$ENTRIES_38" | awk 'NR==4'
    echo "$ENTRIES_38" | awk 'NR==5'
    echo "$ENTRIES_38" | awk 'NR==6'
    echo "$ENTRIES_38" | awk 'NR==7'
    echo "$ENTRIES_38" | awk 'NR==8'
    echo "$ENTRIES_38" | awk 'NR==9'

    echo "$ENTRIES_39" | awk 'NR==1'
    echo "$ENTRIES_39" | awk 'NR==2'
    echo "$ENTRIES_39" | awk 'NR==3'
    echo "$ENTRIES_39" | awk 'NR==4'
    echo "$ENTRIES_39" | awk 'NR==5'
    echo "$ENTRIES_39" | awk 'NR==6'
    echo "$ENTRIES_39" | awk 'NR==7'
    echo "$ENTRIES_39" | awk 'NR==8'
    echo "$ENTRIES_39" | awk 'NR==9'
}


if [ -f "$LOGS/pass_check_entries_youtube" ]; then
    rm -f "$LOGS/*check_entries_youtube"
    CHECK_ENTRIES > "$LOGS/check_entries_youtube"
    echo -e "\nENTRIES:============================================\n"
    cat "$LOGS/check_entries_youtube"
    rm -f "$LOGS/pass_check_entries_youtube"
fi

if [ ! -f "$LOGS/pass_check_entries_youtube" ]; then
    CHECK_ENTRIES > "$LOGS/recheck_entries_youtube"
    echo -e "\nENTRIES:============================================\n"
    cat "$LOGS/check_entries_youtube"
    echo -e "\nRECHECK ENTRIES:====================================\n"
    cat "$LOGS/recheck_entries_youtube"
    DIFF=$(diff -s "$LOGS/check_entries_youtube" "$LOGS/recheck_entries_youtube")
fi

UPDATES="$(echo -e "\n$DIFF\n" | grep -c '^>')"

echo "$UPDATES" > "$LOGS/rss_youtube"
echo -e "\n$UPDATES Updates\n"

NOT=$(kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "$UPDATES Updates" 8 && paplay "$HOME/.local/share/sounds/cause-and-effect.ogg")

[ "$UPDATES" -eq 1 ] && "$NOT"
[ "$UPDATES" -eq 5 ] && "$NOT"
[ "$UPDATES" -eq 10 ] && "$NOT"
[ "$UPDATES" -eq 15 ] && "$NOT"
[ "$UPDATES" -eq 20 ] && "$NOT"

# crontab -e
# */5 * * * * ~/Scripts/Bash/Polybar/rss_youtube.sh
# crontab -l