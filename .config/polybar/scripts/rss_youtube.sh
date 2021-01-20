#!/bin/bash

if [ pgrep -x "*.exe" ];then
    exit
fi

LOGS="$HOME/.config/polybar/scripts/Logs/YouTube"

[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -f "$LOGS/rss_youtube" ] && echo "0" > "$LOGS/rss_youtube"

echo -e "\nUpdating Entries...\n"

# Linux
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
URL_14="https://www.youtube.com/feeds/videos.xml?channel_id=UC2NItvpCsmSkI8LdafCh97g" # el bemoldemarmol
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

# Mistery
URL_40="https://www.youtube.com/feeds/videos.xml?channel_id=UCXoXljexfCDZLj4SrrD6Q1w" # Andrea Alerta
URL_41="https://www.youtube.com/feeds/videos.xml?channel_id=UCd6oFPuWw825Aw_gV_Xa21g" # ANGEL RUIZ OJEDA
URL_42="https://www.youtube.com/feeds/videos.xml?channel_id=UCUbg4D2kdClf34xu7F2kG9Q" # Canal de Roly Polanco
URL_43="https://www.youtube.com/feeds/videos.xml?channel_id=UC6bmn-6O0s0-F7rNH6Xx07A" # Cosmic Consciousness with Jonas
URL_44="https://www.youtube.com/feeds/videos.xml?channel_id=UC_p3X5yMGs_LvtGTU-1ZsAQ" # DavidParcerisaLive
URL_45="https://www.youtube.com/feeds/videos.xml?channel_id=UCxwWUF4NiXO6KZlQD0zcu2g" # El Nuevo Amanecer
URL_46="https://www.youtube.com/feeds/videos.xml?channel_id=UCX-F2q3iv0rK7e7W59kThZg" # El Relleno Misterios
URL_47="https://www.youtube.com/feeds/videos.xml?channel_id=UCM0AdqMFG8_TSL7MJy--RCA" # Jaconor 73
URL_48="https://www.youtube.com/feeds/videos.xml?channel_id=UCq_50owIFPeREuXxnYzMmKA" # Lorena Martín Resonando Con Tu Esencia
URL_49="https://www.youtube.com/feeds/videos.xml?channel_id=UC4Vm2JlEwPZmfbwPD13O5sw" # Luciernaga1962
URL_50="https://www.youtube.com/feeds/videos.xml?channel_id=UCw5x89dM0RQTR3gd8bm0zhQ" # Martin Laplace
URL_51="https://www.youtube.com/feeds/videos.xml?channel_id=UCqtBRc_K5jSiA4ssdWGbzdg" # Naturnia
URL_52="https://www.youtube.com/feeds/videos.xml?channel_id=UC00t8KjOTEG5E1_lIwjG7hg" # Ponencias Zen
URL_53="https://www.youtube.com/feeds/videos.xml?channel_id=UCUyk0KLo7JPLCCh4oRNLzsQ" # Quantum Gravity Research
URL_54="https://www.youtube.com/feeds/videos.xml?channel_id=UCRwExXfoGXMCwkArli449Ag" # REAL SPIRIT DYNAMICS
URL_55="https://www.youtube.com/feeds/videos.xml?channel_id=UCmdvAxEJ14EvXdASKbodj1Q" # RIMBEL35
URL_56="https://www.youtube.com/feeds/videos.xml?channel_id=UC1KIUp4PNCyIwCPTq1hYzWQ" # Teal Swan
URL_57="https://www.youtube.com/feeds/videos.xml?channel_id=UCQqcW6kDv64Rd-xCKQ8mc8g" # UNSALTOQUANTICO
URL_58="https://www.youtube.com/feeds/videos.xml?channel_id=UCALE1jdtTAmgzyyH4FMU5pQ" # Verdad Oculta
URL_59="https://www.youtube.com/feeds/videos.xml?channel_id=UCcbUuPjp7J32YSIESrUe76A" # Vm granmisterio
URL_60="https://www.youtube.com/feeds/videos.xml?channel_id=UC8UexTu0pRdzJU83eLXGPIA" # Zohar StarGate Ancient Discoveries


ENTRIES_1=$(curl -s "$URL_1" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_2=$(curl -s "$URL_2" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_3=$(curl -s "$URL_3" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_4=$(curl -s "$URL_4" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_5=$(curl -s "$URL_5" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_6=$(curl -s "$URL_6" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_7=$(curl -s "$URL_7" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_8=$(curl -s "$URL_8" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_9=$(curl -s "$URL_9" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_10=$(curl -s "$URL_10" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_11=$(curl -s "$URL_11" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_12=$(curl -s "$URL_12" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_13=$(curl -s "$URL_13" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_14=$(curl -s "$URL_14" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_15=$(curl -s "$URL_15" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_16=$(curl -s "$URL_16" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_17=$(curl -s "$URL_17" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_18=$(curl -s "$URL_18" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_19=$(curl -s "$URL_19" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_20=$(curl -s "$URL_20" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_21=$(curl -s "$URL_21" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_22=$(curl -s "$URL_22" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_23=$(curl -s "$URL_23" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_24=$(curl -s "$URL_24" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_25=$(curl -s "$URL_25" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_26=$(curl -s "$URL_26" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_27=$(curl -s "$URL_27" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_28=$(curl -s "$URL_28" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_29=$(curl -s "$URL_29" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_30=$(curl -s "$URL_30" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_31=$(curl -s "$URL_31" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_32=$(curl -s "$URL_32" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_33=$(curl -s "$URL_33" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_34=$(curl -s "$URL_34" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_35=$(curl -s "$URL_35" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_36=$(curl -s "$URL_36" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_37=$(curl -s "$URL_37" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_38=$(curl -s "$URL_38" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_39=$(curl -s "$URL_39" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_40=$(curl -s "$URL_40" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_41=$(curl -s "$URL_41" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_42=$(curl -s "$URL_42" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_43=$(curl -s "$URL_43" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_44=$(curl -s "$URL_44" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_45=$(curl -s "$URL_45" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_46=$(curl -s "$URL_46" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_47=$(curl -s "$URL_47" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_48=$(curl -s "$URL_48" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_49=$(curl -s "$URL_49" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_50=$(curl -s "$URL_50" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_51=$(curl -s "$URL_51" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_52=$(curl -s "$URL_52" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_53=$(curl -s "$URL_53" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_54=$(curl -s "$URL_54" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_55=$(curl -s "$URL_55" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_56=$(curl -s "$URL_56" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_57=$(curl -s "$URL_57" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_58=$(curl -s "$URL_58" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_59=$(curl -s "$URL_59" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
ENTRIES_60=$(curl -s "$URL_60" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')


CHECK_ENTRIES(){
    echo -e "\n<==============================================================>"
    echo -e "                           Linux"
    echo "<==============================================================>"
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

    echo -e "\n<=============================================================>"
    echo "                            Gaming"
    echo "<=============================================================>"
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

    echo -e "\n<=============================================================>"
    echo "                            Gaming-Retro"
    echo "<=============================================================>"
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

    echo -e "\n<=============================================================>"
    echo "                           Mistery"
    echo "<=============================================================>"
    echo "$ENTRIES_40" | awk 'NR==1'
    echo "$ENTRIES_40" | awk 'NR==2'
    echo "$ENTRIES_40" | awk 'NR==3'
    echo "$ENTRIES_40" | awk 'NR==4'
    echo "$ENTRIES_40" | awk 'NR==5'
    echo "$ENTRIES_40" | awk 'NR==6'
    echo "$ENTRIES_40" | awk 'NR==7'
    echo "$ENTRIES_40" | awk 'NR==8'
    echo "$ENTRIES_40" | awk 'NR==9'

    echo "$ENTRIES_41" | awk 'NR==1'
    echo "$ENTRIES_41" | awk 'NR==2'
    echo "$ENTRIES_41" | awk 'NR==3'
    echo "$ENTRIES_41" | awk 'NR==4'
    echo "$ENTRIES_41" | awk 'NR==5'
    echo "$ENTRIES_41" | awk 'NR==6'
    echo "$ENTRIES_41" | awk 'NR==7'
    echo "$ENTRIES_41" | awk 'NR==8'
    echo "$ENTRIES_41" | awk 'NR==9'

    echo "$ENTRIES_42" | awk 'NR==1'
    echo "$ENTRIES_42" | awk 'NR==2'
    echo "$ENTRIES_42" | awk 'NR==3'
    echo "$ENTRIES_42" | awk 'NR==4'
    echo "$ENTRIES_42" | awk 'NR==5'
    echo "$ENTRIES_42" | awk 'NR==6'
    echo "$ENTRIES_42" | awk 'NR==7'
    echo "$ENTRIES_42" | awk 'NR==8'
    echo "$ENTRIES_42" | awk 'NR==9'

    echo "$ENTRIES_43" | awk 'NR==1'
    echo "$ENTRIES_43" | awk 'NR==2'
    echo "$ENTRIES_43" | awk 'NR==3'
    echo "$ENTRIES_43" | awk 'NR==4'
    echo "$ENTRIES_43" | awk 'NR==5'
    echo "$ENTRIES_43" | awk 'NR==6'
    echo "$ENTRIES_43" | awk 'NR==7'
    echo "$ENTRIES_43" | awk 'NR==8'
    echo "$ENTRIES_43" | awk 'NR==9'

    echo "$ENTRIES_44" | awk 'NR==1'
    echo "$ENTRIES_44" | awk 'NR==2'
    echo "$ENTRIES_44" | awk 'NR==3'
    echo "$ENTRIES_44" | awk 'NR==4'
    echo "$ENTRIES_44" | awk 'NR==5'
    echo "$ENTRIES_44" | awk 'NR==6'
    echo "$ENTRIES_44" | awk 'NR==7'
    echo "$ENTRIES_44" | awk 'NR==8'
    echo "$ENTRIES_44" | awk 'NR==9'

    echo "$ENTRIES_45" | awk 'NR==1'
    echo "$ENTRIES_45" | awk 'NR==2'
    echo "$ENTRIES_45" | awk 'NR==3'
    echo "$ENTRIES_45" | awk 'NR==4'
    echo "$ENTRIES_45" | awk 'NR==5'
    echo "$ENTRIES_45" | awk 'NR==6'
    echo "$ENTRIES_45" | awk 'NR==7'
    echo "$ENTRIES_45" | awk 'NR==8'
    echo "$ENTRIES_45" | awk 'NR==9'

    echo "$ENTRIES_46" | awk 'NR==1'
    echo "$ENTRIES_46" | awk 'NR==2'
    echo "$ENTRIES_46" | awk 'NR==3'
    echo "$ENTRIES_46" | awk 'NR==4'
    echo "$ENTRIES_46" | awk 'NR==5'
    echo "$ENTRIES_46" | awk 'NR==6'
    echo "$ENTRIES_46" | awk 'NR==7'
    echo "$ENTRIES_46" | awk 'NR==8'
    echo "$ENTRIES_46" | awk 'NR==9'

    echo "$ENTRIES_47" | awk 'NR==1'
    echo "$ENTRIES_47" | awk 'NR==2'
    echo "$ENTRIES_47" | awk 'NR==3'
    echo "$ENTRIES_47" | awk 'NR==4'
    echo "$ENTRIES_47" | awk 'NR==5'
    echo "$ENTRIES_47" | awk 'NR==6'
    echo "$ENTRIES_47" | awk 'NR==7'
    echo "$ENTRIES_47" | awk 'NR==8'
    echo "$ENTRIES_47" | awk 'NR==9'

    echo "$ENTRIES_48" | awk 'NR==1'
    echo "$ENTRIES_48" | awk 'NR==2'
    echo "$ENTRIES_48" | awk 'NR==3'
    echo "$ENTRIES_48" | awk 'NR==4'
    echo "$ENTRIES_48" | awk 'NR==5'
    echo "$ENTRIES_48" | awk 'NR==6'
    echo "$ENTRIES_48" | awk 'NR==7'
    echo "$ENTRIES_48" | awk 'NR==8'
    echo "$ENTRIES_48" | awk 'NR==9'

    echo "$ENTRIES_49" | awk 'NR==1'
    echo "$ENTRIES_49" | awk 'NR==2'
    echo "$ENTRIES_49" | awk 'NR==3'
    echo "$ENTRIES_49" | awk 'NR==4'
    echo "$ENTRIES_49" | awk 'NR==5'
    echo "$ENTRIES_49" | awk 'NR==6'
    echo "$ENTRIES_49" | awk 'NR==7'
    echo "$ENTRIES_49" | awk 'NR==8'
    echo "$ENTRIES_49" | awk 'NR==9'

    echo "$ENTRIES_50" | awk 'NR==1'
    echo "$ENTRIES_50" | awk 'NR==2'
    echo "$ENTRIES_50" | awk 'NR==3'
    echo "$ENTRIES_50" | awk 'NR==4'
    echo "$ENTRIES_50" | awk 'NR==5'
    echo "$ENTRIES_50" | awk 'NR==6'
    echo "$ENTRIES_50" | awk 'NR==7'
    echo "$ENTRIES_50" | awk 'NR==8'
    echo "$ENTRIES_50" | awk 'NR==9'

    echo "$ENTRIES_51" | awk 'NR==1'
    echo "$ENTRIES_51" | awk 'NR==2'
    echo "$ENTRIES_51" | awk 'NR==3'
    echo "$ENTRIES_51" | awk 'NR==4'
    echo "$ENTRIES_51" | awk 'NR==5'
    echo "$ENTRIES_51" | awk 'NR==6'
    echo "$ENTRIES_51" | awk 'NR==7'
    echo "$ENTRIES_51" | awk 'NR==8'
    echo "$ENTRIES_51" | awk 'NR==9'

    echo "$ENTRIES_52" | awk 'NR==1'
    echo "$ENTRIES_52" | awk 'NR==2'
    echo "$ENTRIES_52" | awk 'NR==3'
    echo "$ENTRIES_52" | awk 'NR==4'
    echo "$ENTRIES_52" | awk 'NR==5'
    echo "$ENTRIES_52" | awk 'NR==6'
    echo "$ENTRIES_52" | awk 'NR==7'
    echo "$ENTRIES_52" | awk 'NR==8'
    echo "$ENTRIES_52" | awk 'NR==9'

    echo "$ENTRIES_53" | awk 'NR==1'
    echo "$ENTRIES_53" | awk 'NR==2'
    echo "$ENTRIES_53" | awk 'NR==3'
    echo "$ENTRIES_53" | awk 'NR==4'
    echo "$ENTRIES_53" | awk 'NR==5'
    echo "$ENTRIES_53" | awk 'NR==6'
    echo "$ENTRIES_53" | awk 'NR==7'
    echo "$ENTRIES_53" | awk 'NR==8'
    echo "$ENTRIES_53" | awk 'NR==9'

    echo "$ENTRIES_54" | awk 'NR==1'
    echo "$ENTRIES_54" | awk 'NR==2'
    echo "$ENTRIES_54" | awk 'NR==3'
    echo "$ENTRIES_54" | awk 'NR==4'
    echo "$ENTRIES_54" | awk 'NR==5'
    echo "$ENTRIES_54" | awk 'NR==6'
    echo "$ENTRIES_54" | awk 'NR==7'
    echo "$ENTRIES_54" | awk 'NR==8'
    echo "$ENTRIES_54" | awk 'NR==9'

    echo "$ENTRIES_55" | awk 'NR==1'
    echo "$ENTRIES_55" | awk 'NR==2'
    echo "$ENTRIES_55" | awk 'NR==3'
    echo "$ENTRIES_55" | awk 'NR==4'
    echo "$ENTRIES_55" | awk 'NR==5'
    echo "$ENTRIES_55" | awk 'NR==6'
    echo "$ENTRIES_55" | awk 'NR==7'
    echo "$ENTRIES_55" | awk 'NR==8'
    echo "$ENTRIES_55" | awk 'NR==9'

    echo "$ENTRIES_56" | awk 'NR==1'
    echo "$ENTRIES_56" | awk 'NR==2'
    echo "$ENTRIES_56" | awk 'NR==3'
    echo "$ENTRIES_56" | awk 'NR==4'
    echo "$ENTRIES_56" | awk 'NR==5'
    echo "$ENTRIES_56" | awk 'NR==6'
    echo "$ENTRIES_56" | awk 'NR==7'
    echo "$ENTRIES_56" | awk 'NR==8'
    echo "$ENTRIES_56" | awk 'NR==9'

    echo "$ENTRIES_57" | awk 'NR==1'
    echo "$ENTRIES_57" | awk 'NR==2'
    echo "$ENTRIES_57" | awk 'NR==3'
    echo "$ENTRIES_57" | awk 'NR==4'
    echo "$ENTRIES_57" | awk 'NR==5'
    echo "$ENTRIES_57" | awk 'NR==6'
    echo "$ENTRIES_57" | awk 'NR==7'
    echo "$ENTRIES_57" | awk 'NR==8'
    echo "$ENTRIES_57" | awk 'NR==9'

    echo "$ENTRIES_58" | awk 'NR==1'
    echo "$ENTRIES_58" | awk 'NR==2'
    echo "$ENTRIES_58" | awk 'NR==3'
    echo "$ENTRIES_58" | awk 'NR==4'
    echo "$ENTRIES_58" | awk 'NR==5'
    echo "$ENTRIES_58" | awk 'NR==6'
    echo "$ENTRIES_58" | awk 'NR==7'
    echo "$ENTRIES_58" | awk 'NR==8'
    echo "$ENTRIES_58" | awk 'NR==9'

    echo "$ENTRIES_59" | awk 'NR==1'
    echo "$ENTRIES_59" | awk 'NR==2'
    echo "$ENTRIES_59" | awk 'NR==3'
    echo "$ENTRIES_59" | awk 'NR==4'
    echo "$ENTRIES_59" | awk 'NR==5'
    echo "$ENTRIES_59" | awk 'NR==6'
    echo "$ENTRIES_59" | awk 'NR==7'
    echo "$ENTRIES_59" | awk 'NR==8'
    echo "$ENTRIES_59" | awk 'NR==9'

    echo "$ENTRIES_60" | awk 'NR==1'
    echo "$ENTRIES_60" | awk 'NR==2'
    echo "$ENTRIES_60" | awk 'NR==3'
    echo "$ENTRIES_60" | awk 'NR==4'
    echo "$ENTRIES_60" | awk 'NR==5'
    echo "$ENTRIES_60" | awk 'NR==6'
    echo "$ENTRIES_60" | awk 'NR==7'
    echo "$ENTRIES_60" | awk 'NR==8'
    echo "$ENTRIES_60" | awk 'NR==9'

}


if [ -f "$LOGS"/pass_check_entries_youtube ];then
    rm -f "$LOGS"/*check_entries_youtube
    CHECK_ENTRIES > "$LOGS"/check_entries_youtube
    echo -e "\n<---------------------- ENTRIES ---------------------->\n"
    cat "$LOGS"/check_entries_youtube
    rm -f "$LOGS"/pass_check_entries_youtube
fi

if [ ! -f "$LOGS"/pass_check_entries_youtube ];then
    CHECK_ENTRIES > "$LOGS"/recheck_entries_youtube
    echo -e "\n<---------------------- RECHECK ENTRIES ---------------------->\n"
    cat "$LOGS"/recheck_entries_youtube
    DIFF=$(diff -s "$LOGS"/check_entries_youtube "$LOGS"/recheck_entries_youtube)
fi

UPDATES="$(echo -e "\n$DIFF\n" | grep -c '^>')"

echo "$UPDATES" > "$LOGS"/rss_youtube
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