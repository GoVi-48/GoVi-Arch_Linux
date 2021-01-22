#!/bin/bash

pgrep -x "wineserver" > /dev/null  && exit

LOGS="$HOME/.config/polybar/scripts/Logs/YouTube"

[ ! -d "$LOGS" ] && mkdir -p "$LOGS"
[ ! -f "$LOGS/rss_youtube" ] && echo "0" > "$LOGS"/rss_youtube

echo -e "\nUpdating Entries...\n"


L_BLUE='\033[1;34m'
NC='\033[0m'

#awk '/L_BLUE}Linux/{flag=1; next} /#END/{flag=0} flag {print}' /home/govi/Scripts/Bash/Polybar/rss_youtube.sh

CHECK_ENTRIES(){
    echo -e "\n<==============================================================>"
    echo -e "                           ${L_BLUE}Linux${NC}"
    echo "<==============================================================>"

    ENTRIES_Luke_Smith=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo $ENTRIES_Luke_Smith | awk 'NR==1'; echo "$ENTRIES_Luke_Smith" | awk 'NR==2'; echo "$ENTRIES_Luke_Smith" | awk 'NR==3'; echo "$ENTRIES_Luke_Smith" | awk 'NR==4'; echo "$ENTRIES_Luke_Smith" | awk 'NR==5'; echo "$ENTRIES_Luke_Smith" | awk 'NR==6'; echo "$ENTRIES_Luke_Smith" | awk 'NR==7'; echo "$ENTRIES_Luke_Smith" | awk 'NR==8'; echo "$ENTRIES_Luke_Smith" | awk 'NR==9'

    ENTRIES_Distrotube=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Distrotube" | awk 'NR==1'; echo "$ENTRIES_Distrotube" | awk 'NR==2'; echo "$ENTRIES_Distrotube" | awk 'NR==3'; echo "$ENTRIES_Distrotube" | awk 'NR==4'; echo "$ENTRIES_Distrotube" | awk 'NR==5'; echo "$ENTRIES_Distrotube" | awk 'NR==6'; echo "$ENTRIES_Distrotube" | awk 'NR==7'; echo "$ENTRIES_Distrotube" | awk 'NR==8'; echo "$ENTRIES_Distrotube" | awk 'NR==9'

    ENTRIES_Brodie_Robertson=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Brodie_Robertson" | awk 'NR==1'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==2'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==3'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==4'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==5'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==6'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==7'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==8'; echo "$ENTRIES_Brodie_Robertson" | awk 'NR==9'

    ENTRIES_Average_Linux_User=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCZiL6BoryLWxyapUuVYW27g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Average_Linux_User" | awk 'NR==1'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==2'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==3'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==4'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==5'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==6'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==7'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==8'; echo "$ENTRIES_Average_Linux_User" | awk 'NR==9'

    ENTRIES_Joe_Collins=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCTfabOKD7Yty6sDF4POBVqA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Joe_Collins" | awk 'NR==1'; echo "$ENTRIES_Joe_Collins" | awk 'NR==2'; echo "$ENTRIES_Joe_Collins" | awk 'NR==3'; echo "$ENTRIES_Joe_Collins" | awk 'NR==4'; echo "$ENTRIES_Joe_Collins" | awk 'NR==5'; echo "$ENTRIES_Joe_Collins" | awk 'NR==6'; echo "$ENTRIES_Joe_Collins" | awk 'NR==7'; echo "$ENTRIES_Joe_Collins" | awk 'NR==8'; echo "$ENTRIES_Joe_Collins" | awk 'NR==9'

    ENTRIES_The_Linux_Experiment=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC5UAwBUum7CPN5buc-_N1Fw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==1'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==2'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==3'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==4'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==5'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==6'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==7'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==8'; echo "$ENTRIES_The_Linux_Experiment" | awk 'NR==9'

    ENTRIES_Nikolay_Stefanov=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCm21eK86ZmD0FQoNPGqvKlw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==1'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==2'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==3'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==4'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==5'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==6'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==7'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==8'; echo "$ENTRIES_Nikolay_Stefanov" | awk 'NR==9'

    ENTRIES_OldTechBloke=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCCIHOP7e271SIumQgyl6XBQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_OldTechBloke" | awk 'NR==1'; echo "$ENTRIES_OldTechBloke" | awk 'NR==2'; echo "$ENTRIES_OldTechBloke" | awk 'NR==3'; echo "$ENTRIES_OldTechBloke" | awk 'NR==4'; echo "$ENTRIES_OldTechBloke" | awk 'NR==5'; echo "$ENTRIES_OldTechBloke" | awk 'NR==6'; echo "$ENTRIES_OldTechBloke" | awk 'NR==7'; echo "$ENTRIES_OldTechBloke" | awk 'NR==8'; echo "$ENTRIES_OldTechBloke" | awk 'NR==9'

    ENTRIES_Chris_Titus_Tech=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCg6gPGh8HU2U01vaFCAsvmQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==1'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==2'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==3'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==4'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==5'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==6'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==7'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==8'; echo "$ENTRIES_Chris_Titus_Tech" | awk 'NR==9'

    ENTRIES_Titus_Tech_Talk=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCtYg149E_wUGVmjGz-TgyNA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==1'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==2'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==3'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==4'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==5'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==6'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==7'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==8'; echo "$ENTRIES_Titus_Tech_Talk" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                            ${L_BLUE}Gaming"${NC}
    echo "<=============================================================>"

    ENTRIES_72hrs=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC8l4P6qZNLV0ApCExQrwhhA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_72hrs" | awk 'NR==1'; echo "$ENTRIES_72hrs" | awk 'NR==2'; echo "$ENTRIES_72hrs" | awk 'NR==3'; echo "$ENTRIES_72hrs" | awk 'NR==4'; echo "$ENTRIES_72hrs" | awk 'NR==5'; echo "$ENTRIES_72hrs" | awk 'NR==6'; echo "$ENTRIES_72hrs" | awk 'NR==7'; echo "$ENTRIES_72hrs" | awk 'NR==8'; echo "$ENTRIES_72hrs" | awk 'NR==9'

    ENTRIES_ALIENANGE=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCzXR8qGGPRa32ZoMIzt5VSw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_ALIENANGE" | awk 'NR==1'; echo "$ENTRIES_ALIENANGE" | awk 'NR==2'; echo "$ENTRIES_ALIENANGE" | awk 'NR==3'; echo "$ENTRIES_ALIENANGE" | awk 'NR==4'; echo "$ENTRIES_ALIENANGE" | awk 'NR==5'; echo "$ENTRIES_ALIENANGE" | awk 'NR==6'; echo "$ENTRIES_ALIENANGE" | awk 'NR==7'; echo "$ENTRIES_ALIENANGE" | awk 'NR==8'; echo "$ENTRIES_ALIENANGE" | awk 'NR==9'

    ENTRIES_BCC_Gaming=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCBw-Dz6wHRkxiXKCLoWqDzA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_BCC_Gaming" | awk 'NR==1'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==2'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==3'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==4'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==5'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==6'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==7'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==8'; echo "$ENTRIES_BCC_Gaming" | awk 'NR==9'

    ENTRIES_el_bemoldemarmol=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC2NItvpCsmSkI8LdafCh97g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==1'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==2'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==3'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==4'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==5'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==6'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==7'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==8'; echo "$ENTRIES_el_bemoldemarmol" | awk 'NR==9'

    ENTRIES_GameProTV=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXgeThZc7YiGnNkPjfaWdRQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_GameProTV" | awk 'NR==1'; echo "$ENTRIES_GameProTV" | awk 'NR==2'; echo "$ENTRIES_GameProTV" | awk 'NR==3'; echo "$ENTRIES_GameProTV" | awk 'NR==4'; echo "$ENTRIES_GameProTV" | awk 'NR==5'; echo "$ENTRIES_GameProTV" | awk 'NR==6'; echo "$ENTRIES_GameProTV" | awk 'NR==7'; echo "$ENTRIES_GameProTV" | awk 'NR==8'; echo "$ENTRIES_GameProTV" | awk 'NR==9'

    ENTRIES_IGN=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCKy1dAqELo0zrOtPkf0eTMw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_IGN" | awk 'NR==1'; echo "$ENTRIES_IGN" | awk 'NR==2'; echo "$ENTRIES_IGN" | awk 'NR==3'; echo "$ENTRIES_IGN" | awk 'NR==4'; echo "$ENTRIES_IGN" | awk 'NR==5'; echo "$ENTRIES_IGN" | awk 'NR==6'; echo "$ENTRIES_IGN" | awk 'NR==7'; echo "$ENTRIES_IGN" | awk 'NR==8'; echo "$ENTRIES_IGN" | awk 'NR==9'

    ENTRIES_ImKibitz=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCz9qw5nupdzCGwHwQiqs7qA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_ImKibitz" | awk 'NR==1'; echo "$ENTRIES_ImKibitz" | awk 'NR==2'; echo "$ENTRIES_ImKibitz" | awk 'NR==3'; echo "$ENTRIES_ImKibitz" | awk 'NR==4'; echo "$ENTRIES_ImKibitz" | awk 'NR==5'; echo "$ENTRIES_ImKibitz" | awk 'NR==6'; echo "$ENTRIES_ImKibitz" | awk 'NR==7'; echo "$ENTRIES_ImKibitz" | awk 'NR==8'; echo "$ENTRIES_ImKibitz" | awk 'NR==9'

    ENTRIES_InsertMoreCoins=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCq8n2oMl5dVugY_u4pzwoOQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_InsertMoreCoins" | awk 'NR==1'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==2'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==3'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==4'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==5'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==6'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==7'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==8'; echo "$ENTRIES_InsertMoreCoins" | awk 'NR==9'

    ENTRIES_j0hnbane=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCtSKdz7X4QhaL6LgyOhCViQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_j0hnbane" | awk 'NR==1'; echo "$ENTRIES_j0hnbane" | awk 'NR==2'; echo "$ENTRIES_j0hnbane" | awk 'NR==3'; echo "$ENTRIES_j0hnbane" | awk 'NR==4'; echo "$ENTRIES_j0hnbane" | awk 'NR==5'; echo "$ENTRIES_j0hnbane" | awk 'NR==6'; echo "$ENTRIES_j0hnbane" | awk 'NR==7'; echo "$ENTRIES_j0hnbane" | awk 'NR==8'; echo "$ENTRIES_j0hnbane" | awk 'NR==9'

    ENTRIES_Lethamyr=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCkNYoWK1LqjFhxYI6BM_kOA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Lethamyr" | awk 'NR==1'; echo "$ENTRIES_Lethamyr" | awk 'NR==2'; echo "$ENTRIES_Lethamyr" | awk 'NR==3'; echo "$ENTRIES_Lethamyr" | awk 'NR==4'; echo "$ENTRIES_Lethamyr" | awk 'NR==5'; echo "$ENTRIES_Lethamyr" | awk 'NR==6'; echo "$ENTRIES_Lethamyr" | awk 'NR==7'; echo "$ENTRIES_Lethamyr" | awk 'NR==8'; echo "$ENTRIES_Lethamyr" | awk 'NR==9'

    ENTRIES_Loeya=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCARoT-xFUIxso8TDKulWSYA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Loeya" | awk 'NR==1'; echo "$ENTRIES_Loeya" | awk 'NR==2'; echo "$ENTRIES_Loeya" | awk 'NR==3'; echo "$ENTRIES_Loeya" | awk 'NR==4'; echo "$ENTRIES_Loeya" | awk 'NR==5'; echo "$ENTRIES_Loeya" | awk 'NR==6'; echo "$ENTRIES_Loeya" | awk 'NR==7'; echo "$ENTRIES_Loeya" | awk 'NR==8'; echo "$ENTRIES_Loeya" | awk 'NR==9'

    ENTRIES_MrGrimmmz=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCNRrmKwVzQThSs2w2JpDM1A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_MrGrimmmz" | awk 'NR==1'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==2'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==3'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==4'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==5'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==6'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==7'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==8'; echo "$ENTRIES_MrGrimmmz" | awk 'NR==9'

    ENTRIES_Oh_Long_Johnson=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCdQdmd81Mw0Qx-GJn7ExJRw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==1'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==2'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==3'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==4'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==5'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==6'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==7'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==8'; echo "$ENTRIES_Oh_Long_Johnson" | awk 'NR==9'

    ENTRIES_Rosdri=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCLdrFLVHsqyLt2Z6lQmf5cQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Rosdri" | awk 'NR==1'; echo "$ENTRIES_Rosdri" | awk 'NR==2'; echo "$ENTRIES_Rosdri" | awk 'NR==3'; echo "$ENTRIES_Rosdri" | awk 'NR==4'; echo "$ENTRIES_Rosdri" | awk 'NR==5'; echo "$ENTRIES_Rosdri" | awk 'NR==6'; echo "$ENTRIES_Rosdri" | awk 'NR==7'; echo "$ENTRIES_Rosdri" | awk 'NR==8'; echo "$ENTRIES_Rosdri" | awk 'NR==9'

    ENTRIES_Sl1pg8r=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCB9y6hNzccY5rTQlnI1KNqA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Sl1pg8r" | awk 'NR==1'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==2'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==3'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==4'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==5'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==6'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==7'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==8'; echo "$ENTRIES_Sl1pg8r" | awk 'NR==9'

    ENTRIES_thatdenverguy=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCN_kkuZ1b1emUHq2Fz3DWuQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_thatdenverguy" | awk 'NR==1'; echo "$ENTRIES_thatdenverguy" | awk 'NR==2'; echo "$ENTRIES_thatdenverguy" | awk 'NR==3'; echo "$ENTRIES_thatdenverguy" | awk 'NR==4'; echo "$ENTRIES_thatdenverguy" | awk 'NR==5'; echo "$ENTRIES_thatdenverguy" | awk 'NR==6'; echo "$ENTRIES_thatdenverguy" | awk 'NR==7'; echo "$ENTRIES_thatdenverguy" | awk 'NR==8'; echo "$ENTRIES_thatdenverguy" | awk 'NR==9'

    ENTRIES_Tortilla_Squad=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC3C9dOKpyemQCCJqsYt3ySQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Tortilla_Squad" | awk 'NR==1'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==2'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==3'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==4'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==5'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==6'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==7'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==8'; echo "$ENTRIES_Tortilla_Squad" | awk 'NR==9'

    ENTRIES_Verox_Pivigames=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC7NO1-kIHv6vJTwuKxTNhmA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Verox_Pivigames" | awk 'NR==1'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==2'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==3'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==4'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==5'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==6'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==7'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==8'; echo "$ENTRIES_Verox_Pivigames" | awk 'NR==9'

    ENTRIES_WASDCommunity=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC3cbD8JQJtHSCKVVN_hu1kA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_WASDCommunity" | awk 'NR==1'; echo "$ENTRIES_WASDCommunity" | awk 'NR==2'; echo "$ENTRIES_WASDCommunity" | awk 'NR==3'; echo "$ENTRIES_WASDCommunity" | awk 'NR==4'; echo "$ENTRIES_WASDCommunity" | awk 'NR==5'; echo "$ENTRIES_WASDCommunity" | awk 'NR==6'; echo "$ENTRIES_WASDCommunity" | awk 'NR==7'; echo "$ENTRIES_WASDCommunity" | awk 'NR==8'; echo "$ENTRIES_WASDCommunity" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                            ${L_BLUE}Gaming-Retro"${NC}
    echo "<=============================================================>"
    ENTRIES_Arcade_Punks=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCT7P9WXh0wdYY-gRsdJoARg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Arcade_Punks" | awk 'NR==1'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==2'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==3'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==4'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==5'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==6'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==7'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==8'; echo "$ENTRIES_Arcade_Punks" | awk 'NR==9'

    ENTRIES_AV_TV=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCOLGDbv1I-BBSK-ZnTi4G0A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_AV_TV" | awk 'NR==1'; echo "$ENTRIES_AV_TV" | awk 'NR==2'; echo "$ENTRIES_AV_TV" | awk 'NR==3'; echo "$ENTRIES_AV_TV" | awk 'NR==4'; echo "$ENTRIES_AV_TV" | awk 'NR==5'; echo "$ENTRIES_AV_TV" | awk 'NR==6'; echo "$ENTRIES_AV_TV" | awk 'NR==7'; echo "$ENTRIES_AV_TV" | awk 'NR==8'; echo "$ENTRIES_AV_TV" | awk 'NR==9'

    ENTRIES_BSoD_Gaming=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCex2B-k-ZIJhcjRdlYUz4MQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==1'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==2'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==3'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==4'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==5'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==6'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==7'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==8'; echo "$ENTRIES_BSoD_Gaming$" | awk 'NR==9'

    ENTRIES_DrewTalks=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCJKXXWD2VtMNjLVvyRv4X1Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_DrewTalks" | awk 'NR==1'; echo "$ENTRIES_DrewTalks" | awk 'NR==2'; echo "$ENTRIES_DrewTalks" | awk 'NR==3'; echo "$ENTRIES_DrewTalks" | awk 'NR==4'; echo "$ENTRIES_DrewTalks" | awk 'NR==5'; echo "$ENTRIES_DrewTalks" | awk 'NR==6'; echo "$ENTRIES_DrewTalks" | awk 'NR==7'; echo "$ENTRIES_DrewTalks" | awk 'NR==8'; echo "$ENTRIES_DrewTalks" | awk 'NR==9'

    ENTRIES_El_Hendri=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCEsRJvL_BDmK1faQH5mjNLg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_El_Hendri" | awk 'NR==1'; echo "$ENTRIES_El_Hendri" | awk 'NR==2'; echo "$ENTRIES_El_Hendri" | awk 'NR==3'; echo "$ENTRIES_El_Hendri" | awk 'NR==4'; echo "$ENTRIES_El_Hendri" | awk 'NR==5'; echo "$ENTRIES_El_Hendri" | awk 'NR==6'; echo "$ENTRIES_El_Hendri" | awk 'NR==7'; echo "$ENTRIES_El_Hendri" | awk 'NR==8'; echo "$ENTRIES_El_Hendri" | awk 'NR==9'

    ENTRIES_Harrison_Hacks=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCZ4lyVmGC3yfJl1skgdGYvg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Harrison_Hacks" | awk 'NR==1'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==2'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==3'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==4'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==5'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==6'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==7'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==8'; echo "$ENTRIES_Harrison_Hacks" | awk 'NR==9'

    ENTRIES_JG_Kings06=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCuUu-Ea-F0FJDjQ-LXADQuw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_JG_Kings06" | awk 'NR==1'; echo "$ENTRIES_JG_Kings06" | awk 'NR==2'; echo "$ENTRIES_JG_Kings06" | awk 'NR==3'; echo "$ENTRIES_JG_Kings06" | awk 'NR==4'; echo "$ENTRIES_JG_Kings06" | awk 'NR==5'; echo "$ENTRIES_JG_Kings06" | awk 'NR==6'; echo "$ENTRIES_JG_Kings06" | awk 'NR==7'; echo "$ENTRIES_JG_Kings06" | awk 'NR==8'; echo "$ENTRIES_JG_Kings06" | awk 'NR==9'

    ENTRIES_Simply_Austin=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCb4RFFBZEztOW77onViqoDA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Simply_Austin" | awk 'NR==1'; echo "$ENTRIES_Simply_Austin" | awk 'NR==2'; echo "$ENTRIES_Simply_Austin" | awk 'NR==3'; echo "$ENTRIES_Simply_Austin" | awk 'NR==4'; echo "$ENTRIES_Simply_Austin" | awk 'NR==5'; echo "$ENTRIES_Simply_Austin" | awk 'NR==6'; echo "$ENTRIES_Simply_Austin" | awk 'NR==7'; echo "$ENTRIES_Simply_Austin" | awk 'NR==8'; echo "$ENTRIES_Simply_Austin" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                           ${L_BLUE}Media"${NC}
    echo "<=============================================================>"
    ENTRIES_CyberdogStudios=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCoUpWZ9EKz-F_wK8nMfxpow" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_CyberdogStudios" | awk 'NR==1'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==2'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==3'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==4'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==5'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==6'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==7'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==8'; echo "$ENTRIES_CyberdogStudios" | awk 'NR==9'

    ENTRIES_Diamond_Build=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCkX6dQihoolp88g4AEzxtng" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Diamond_Build" | awk 'NR==1'; echo "$ENTRIES_Diamond_Build" | awk 'NR==2'; echo "$ENTRIES_Diamond_Build" | awk 'NR==3'; echo "$ENTRIES_Diamond_Build" | awk 'NR==4'; echo "$ENTRIES_Diamond_Build" | awk 'NR==5'; echo "$ENTRIES_Diamond_Build" | awk 'NR==6'; echo "$ENTRIES_Diamond_Build" | awk 'NR==7'; echo "$ENTRIES_Diamond_Build" | awk 'NR==8'; echo "$ENTRIES_Diamond_Build" | awk 'NR==9'

    ENTRIES_Dimitrology=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUY5BYXIaZoa4-HclwnNWDA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Dimitrology" | awk 'NR==1'; echo "$ENTRIES_Dimitrology" | awk 'NR==2'; echo "$ENTRIES_Dimitrology" | awk 'NR==3'; echo "$ENTRIES_Dimitrology" | awk 'NR==4'; echo "$ENTRIES_Dimitrology" | awk 'NR==5'; echo "$ENTRIES_Dimitrology" | awk 'NR==6'; echo "$ENTRIES_Dimitrology" | awk 'NR==7'; echo "$ENTRIES_Dimitrology" | awk 'NR==8'; echo "$ENTRIES_Dimitrology" | awk 'NR==9'

    ENTRIES_Freeworld_Media=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCrS-4eNHy0t5Ud_IDipurmg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Freeworld_Media" | awk 'NR==1'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==2'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==3'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==4'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==5'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==6'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==7'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==8'; echo "$ENTRIES_Freeworld_Media" | awk 'NR==9'

    ENTRIES_Peter_Carcione=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCQZcmkkx7hc0ik4wjaAtINQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Peter_Carcione" | awk 'NR==1'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==2'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==3'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==4'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==5'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==6'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==7'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==8'; echo "$ENTRIES_Peter_Carcione" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                           ${L_BLUE}Mistery"${NC}
    echo "<=============================================================>"

    ENTRIES_Andrea_Alerta=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXoXljexfCDZLj4SrrD6Q1w" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Andrea_Alerta" | awk 'NR==1'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==2'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==3'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==4'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==5'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==6'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==7'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==8'; echo "$ENTRIES_Andrea_Alerta" | awk 'NR==9'

    ENTRIES_ANGEL_RUIZ_OJEDA=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCd6oFPuWw825Aw_gV_Xa21g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==1'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==2'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==3'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==4'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==5'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==6'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==7'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==8'; echo "$ENTRIES_ANGEL_RUIZ_OJEDA" | awk 'NR==9'

    ENTRIES_Canal_de_Roly_Polanco=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUbg4D2kdClf34xu7F2kG9Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==1'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==2'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==3'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==4'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==5'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==6'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==7'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==8'; echo "$ENTRIES_Canal_de_Roly_Polanco" | awk 'NR==9'

    ENTRIES_Cosmic_Consciousness_with_Jonas=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC6bmn-6O0s0-F7rNH6Xx07A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==1'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==2'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==3'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==4'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==5'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==6'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==7'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==8'; echo "$ENTRIES_Cosmic_Consciousness_with_Jonas" | awk 'NR==9'

    ENTRIES_DavidParcerisaLive=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC_p3X5yMGs_LvtGTU-1ZsAQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==1'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==2'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==3'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==4'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==5'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==6'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==7'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==8'; echo "$ENTRIES_DavidParcerisaLive" | awk 'NR==9'

    ENTRIES_El_Nuevo_Amanecer=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCxwWUF4NiXO6KZlQD0zcu2g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==1'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==2'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==3'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==4'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==5'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==6'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==7'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==8'; echo "$ENTRIES_El_Nuevo_Amanecer" | awk 'NR==9'

    ENTRIES_El_Relleno_Misterios=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCX-F2q3iv0rK7e7W59kThZg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==1'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==2'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==3'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==4'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==5'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==6'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==7'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==8'; echo "$ENTRIES_El_Relleno_Misterios" | awk 'NR==9'

    ENTRIES_Jaconor_73=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCM0AdqMFG8_TSL7MJy--RCA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Jaconor_73" | awk 'NR==1'; echo "$ENTRIES_Jaconor_73" | awk 'NR==2'; echo "$ENTRIES_Jaconor_73" | awk 'NR==3'; echo "$ENTRIES_Jaconor_73" | awk 'NR==4'; echo "$ENTRIES_Jaconor_73" | awk 'NR==5'; echo "$ENTRIES_Jaconor_73" | awk 'NR==6'; echo "$ENTRIES_Jaconor_73" | awk 'NR==7'; echo "$ENTRIES_Jaconor_73" | awk 'NR==8'; echo "$ENTRIES_Jaconor_73" | awk 'NR==9'

    ENTRIES_Lorena_Martin=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCq_50owIFPeREuXxnYzMmKA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Lorena_Martin" | awk 'NR==1'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==2'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==3'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==4'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==5'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==6'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==7'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==8'; echo "$ENTRIES_Lorena_Martin" | awk 'NR==9'

    ENTRIES_Luciernaga1962=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC4Vm2JlEwPZmfbwPD13O5sw"  | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Luciernaga1962" | awk 'NR==1'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==2'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==3'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==4'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==5'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==6'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==7'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==8'; echo "$ENTRIES_Luciernaga1962" | awk 'NR==9'

    ENTRIES_Martin_Laplace=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCw5x89dM0RQTR3gd8bm0zhQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Martin_Laplace" | awk 'NR==1'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==2'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==3'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==4'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==5'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==6'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==7'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==8'; echo "$ENTRIES_Martin_Laplace" | awk 'NR==9'

    ENTRIES_Naturnia=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCqtBRc_K5jSiA4ssdWGbzdg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Naturnia" | awk 'NR==1'; echo "$ENTRIES_Naturnia" | awk 'NR==2'; echo "$ENTRIES_Naturnia" | awk 'NR==3'; echo "$ENTRIES_Naturnia" | awk 'NR==4'; echo "$ENTRIES_Naturnia" | awk 'NR==5'; echo "$ENTRIES_Naturnia" | awk 'NR==6'; echo "$ENTRIES_Naturnia" | awk 'NR==7'; echo "$ENTRIES_Naturnia" | awk 'NR==8'; echo "$ENTRIES_Naturnia" | awk 'NR==9'

    ENTRIES_Ponencias_Zen=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC00t8KjOTEG5E1_lIwjG7hg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Ponencias_Zen" | awk 'NR==1'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==2'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==3'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==4'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==5'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==6'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==7'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==8'; echo "$ENTRIES_Ponencias_Zen" | awk 'NR==9'

    ENTRIES_Quantum_Gravity_Research=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUyk0KLo7JPLCCh4oRNLzsQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==1'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==2'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==3'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==4'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==5'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==6'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==7'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==8'; echo "$ENTRIES_Quantum_Gravity_Research" | awk 'NR==9'

    ENTRIES_REAL_SPIRIT_DYNAMICS=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCRwExXfoGXMCwkArli449Ag" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==1'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==2'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==3'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==4'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==5'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==6'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==7'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==8'; echo "$ENTRIES_REAL_SPIRIT_DYNAMICS" | awk 'NR==9'

    ENTRIES_RIMBEL35=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCmdvAxEJ14EvXdASKbodj1Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_RIMBEL35" | awk 'NR==1'; echo "$ENTRIES_RIMBEL35" | awk 'NR==2'; echo "$ENTRIES_RIMBEL35" | awk 'NR==3'; echo "$ENTRIES_RIMBEL35" | awk 'NR==4'; echo "$ENTRIES_RIMBEL35" | awk 'NR==5'; echo "$ENTRIES_RIMBEL35" | awk 'NR==6'; echo "$ENTRIES_RIMBEL35" | awk 'NR==7'; echo "$ENTRIES_RIMBEL35" | awk 'NR==8'; echo "$ENTRIES_RIMBEL35" | awk 'NR==9'

    ENTRIES_Teal_Swan=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC1KIUp4PNCyIwCPTq1hYzWQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Teal_Swan" | awk 'NR==1'; echo "$ENTRIES_Teal_Swan" | awk 'NR==2'; echo "$ENTRIES_Teal_Swan" | awk 'NR==3'; echo "$ENTRIES_Teal_Swan" | awk 'NR==4'; echo "$ENTRIES_Teal_Swan" | awk 'NR==5'; echo "$ENTRIES_Teal_Swan" | awk 'NR==6'; echo "$ENTRIES_Teal_Swan" | awk 'NR==7'; echo "$ENTRIES_Teal_Swan" | awk 'NR==8'; echo "$ENTRIES_Teal_Swan" | awk 'NR==9'

    ENTRIES_UNSALTOQUANTICO=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCQqcW6kDv64Rd-xCKQ8mc8g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==1'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==2'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==3'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==4'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==5'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==6'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==7'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==8'; echo "$ENTRIES_UNSALTOQUANTICO" | awk 'NR==9'

    ENTRIES_Verdad_Oculta=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCALE1jdtTAmgzyyH4FMU5pQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Verdad_Oculta" | awk 'NR==1'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==2'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==3'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==4'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==5'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==6'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==7'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==8'; echo "$ENTRIES_Verdad_Oculta" | awk 'NR==9'

    ENTRIES_Vm_granmisterio=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCcbUuPjp7J32YSIESrUe76A" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Vm_granmisterio" | awk 'NR==1'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==2'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==3'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==4'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==5'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==6'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==7'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==8'; echo "$ENTRIES_Vm_granmisterio" | awk 'NR==9'

    ENTRIES_Zohar_StarGate=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC8UexTu0pRdzJU83eLXGPIA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Zohar_StarGate" | awk 'NR==1'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==2'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==3'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==4'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==5'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==6'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==7'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==8'; echo "$ENTRIES_Zohar_StarGate" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                           ${L_BLUE}Sports"${NC}
    echo "<=============================================================>"

    ENTRIES_Derek_Hameister=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCWxA3FTwLeObRKp-gf7CAIQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Derek_Hameister" | awk 'NR==1'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==2'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==3'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==4'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==5'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==6'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==7'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==8'; echo "$ENTRIES_Derek_Hameister" | awk 'NR==9'

    ENTRIES_Devon_Larratt=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCBcMvaSRmSh3362bzvOBerw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Devon_Larratt" | awk 'NR==1'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==2'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==3'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==4'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==5'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==6'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==7'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==8'; echo "$ENTRIES_Devon_Larratt" | awk 'NR==9'

    ENTRIES_Green_Fits=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCvOoVW1ghB0Nxt2duEBGJKw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Green_Fits" | awk 'NR==1'; echo "$ENTRIES_Green_Fits" | awk 'NR==2'; echo "$ENTRIES_Green_Fits" | awk 'NR==3'; echo "$ENTRIES_Green_Fits" | awk 'NR==4'; echo "$ENTRIES_Green_Fits" | awk 'NR==5'; echo "$ENTRIES_Green_Fits" | awk 'NR==6'; echo "$ENTRIES_Green_Fits" | awk 'NR==7'; echo "$ENTRIES_Green_Fits" | awk 'NR==8'; echo "$ENTRIES_Green_Fits" | awk 'NR==9'

    ENTRIES_hugo_van_damme=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC3h8ePFDw-WXLxH3vbAWP-g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_hugo_van_damme" | awk 'NR==1'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==2'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==3'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==4'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==5'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==6'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==7'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==8'; echo "$ENTRIES_hugo_van_damme" | awk 'NR==9'

    ENTRIES_Professor_Live=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC5zJwsFtEs9WYe3A76p7xIA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Professor_Live" | awk 'NR==1'; echo "$ENTRIES_Professor_Live" | awk 'NR==2'; echo "$ENTRIES_Professor_Live" | awk 'NR==3'; echo "$ENTRIES_Professor_Live" | awk 'NR==4'; echo "$ENTRIES_Professor_Live" | awk 'NR==5'; echo "$ENTRIES_Professor_Live" | awk 'NR==6'; echo "$ENTRIES_Professor_Live" | awk 'NR==7'; echo "$ENTRIES_Professor_Live" | awk 'NR==8'; echo "$ENTRIES_Professor_Live" | awk 'NR==9'

    ENTRIES_Top_Gear=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCjOl2AUblVmg2rA_cRgZkFg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Top_Gear" | awk 'NR==1'; echo "$ENTRIES_Top_Gear" | awk 'NR==2'; echo "$ENTRIES_Top_Gear" | awk 'NR==3'; echo "$ENTRIES_Top_Gear" | awk 'NR==4'; echo "$ENTRIES_Top_Gear" | awk 'NR==5'; echo "$ENTRIES_Top_Gear" | awk 'NR==6'; echo "$ENTRIES_Top_Gear" | awk 'NR==7'; echo "$ENTRIES_Top_Gear" | awk 'NR==8'; echo "$ENTRIES_Top_Gear" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                           ${L_BLUE}Tech"${NC}
    echo "<=============================================================>"

    ENTRIES_EF_Tech_Made_Simple=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCX_WM2O-X96URC5n66G-hvw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==1'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==2'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==3'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==4'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==5'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==6'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==7'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==8'; echo "$ENTRIES_EF_Tech_Made_Simple" | awk 'NR==9'

     ENTRIES_ExplainingComputers=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCbiGcwDWZjz05njNPrJU7jA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_ExplainingComputers" | awk 'NR==1'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==2'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==3'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==4'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==5'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==6'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==7'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==8'; echo "$ENTRIES_ExplainingComputers" | awk 'NR==9'

    ENTRIES_Linus_Tech_Tips=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXuqSBlHAE6Xw-yeJA0Tunw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==1'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==2'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==3'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==4'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==5'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==6'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==7'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==8'; echo "$ENTRIES_Linus_Tech_Tips" | awk 'NR==9'

    ENTRIES_Major_Hardware=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUXW4gT27TOaDzKFyN-1tXQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Major_Hardware" | awk 'NR==1'; echo "$ENTRIES_Major_Hardware" | awk 'NR==2'; echo "$ENTRIES_Major_Hardware" | awk 'NR==3'; echo "$ENTRIES_Major_Hardware" | awk 'NR==4'; echo "$ENTRIES_Major_Hardware" | awk 'NR==5'; echo "$ENTRIES_Major_Hardware" | awk 'NR==6'; echo "$ENTRIES_Major_Hardware" | awk 'NR==7'; echo "$ENTRIES_Major_Hardware" | awk 'NR==8'; echo "$ENTRIES_Major_Hardware" | awk 'NR==9'

    ENTRIES_Mis_Movidas=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUCaxgQae2XgmlMz9QzQr7Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Mis_Movidas" | awk 'NR==1'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==2'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==3'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==4'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==5'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==6'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==7'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==8'; echo "$ENTRIES_Mis_Movidas" | awk 'NR==9'

    ENTRIES_Nate_Gentile=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC36xmz34q02JYaZYKrMwXng" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Nate_Gentile" | awk 'NR==1'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==2'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==3'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==4'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==5'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==6'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==7'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==8'; echo "$ENTRIES_Nate_Gentile" | awk 'NR==9'

    ENTRIES_Optimum_Tech=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCRYOj4DmyxhBVrdvbsUwmAA" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Optimum_Tech" | awk 'NR==1'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==2'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==3'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==4'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==5'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==6'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==7'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==8'; echo "$ENTRIES_Optimum_Tech" | awk 'NR==9'

    ENTRIES_Stuff_Made_Here=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCj1VqrHhDte54oLgPG4xpuQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==1'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==2'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==3'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==4'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==5'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==6'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==7'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==8'; echo "$ENTRIES_Stuff_Made_Here" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                           ${L_BLUE}Tutorials"${NC}
    echo "<=============================================================>"

    ENTRIES_Corey_Schafer=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCCezIgC97PvUuR4_gbFUs5g" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Corey_Schafer" | awk 'NR==1'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==2'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==3'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==4'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==5'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==6'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==7'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==8'; echo "$ENTRIES_Corey_Schafer" | awk 'NR==9'

    ENTRIES_FalconMasters=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCJl1YajcPWTeJNsQhGyMIMg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_FalconMasters" | awk 'NR==1'; echo "$ENTRIES_FalconMasters" | awk 'NR==2'; echo "$ENTRIES_FalconMasters" | awk 'NR==3'; echo "$ENTRIES_FalconMasters" | awk 'NR==4'; echo "$ENTRIES_FalconMasters" | awk 'NR==5'; echo "$ENTRIES_FalconMasters" | awk 'NR==6'; echo "$ENTRIES_FalconMasters" | awk 'NR==7'; echo "$ENTRIES_FalconMasters" | awk 'NR==8'; echo "$ENTRIES_FalconMasters" | awk 'NR==9'
#END

    echo -e "\n<=============================================================>"
    echo -e "                           ${L_BLUE}Other"${NC}
    echo "<=============================================================>"

    ENTRIES_DIEGO_MEXIV3RG4S=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCfqTcJv-3I9xTLXJWXM_JVg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==1'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==2'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==3'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==4'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==5'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==6'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==7'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==8'; echo "$ENTRIES_DIEGO_MEXIV3RG4S" | awk 'NR==9'

    ENTRIES_DIY_Perks=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCUQo7nzH1sXVpzL92VesANw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_DIY_Perks" | awk 'NR==1'; echo "$ENTRIES_DIY_Perks" | awk 'NR==2'; echo "$ENTRIES_DIY_Perks" | awk 'NR==3'; echo "$ENTRIES_DIY_Perks" | awk 'NR==4'; echo "$ENTRIES_DIY_Perks" | awk 'NR==5'; echo "$ENTRIES_DIY_Perks" | awk 'NR==6'; echo "$ENTRIES_DIY_Perks" | awk 'NR==7'; echo "$ENTRIES_DIY_Perks" | awk 'NR==8'; echo "$ENTRIES_DIY_Perks" | awk 'NR==9'

    ENTRIES_DrossRotzank=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCNYW2vfGrUE6R5mIJYzkRyQ" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
     echo "$ENTRIES_DrossRotzank" | awk 'NR==1'; echo "$ENTRIES_DrossRotzank" | awk 'NR==2'; echo "$ENTRIES_DrossRotzank" | awk 'NR==3'; echo "$ENTRIES_DrossRotzank" | awk 'NR==4'; echo "$ENTRIES_DrossRotzank" | awk 'NR==5'; echo "$ENTRIES_DrossRotzank" | awk 'NR==6'; echo "$ENTRIES_DrossRotzank" | awk 'NR==7'; echo "$ENTRIES_DrossRotzank" | awk 'NR==8'; echo "$ENTRIES_DrossRotzank" | awk 'NR==9'

    ENTRIES_Series_y_Mas=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCscuAsbMkIKJmqwmAMa1ezw" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Series_y_Mas" | awk 'NR==1'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==2'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==3'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==4'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==5'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==6'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==7'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==8'; echo "$ENTRIES_Series_y_Mas" | awk 'NR==9'

    ENTRIES_Marihuana_Television=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UC59w0wPqfAcCyyi_rnazw4Q" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Marihuana_Television" | awk 'NR==1'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==2'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==3'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==4'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==5'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==6'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==7'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==8'; echo "$ENTRIES_Marihuana_Television" | awk 'NR==9'

    ENTRIES_Veritasium_en_espanol=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCXtxgWwk55kVJo9lCCZRdmg" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==1'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==2'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==3'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==4'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==5'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==6'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==7'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==8'; echo "$ENTRIES_Veritasium_en_espanol" | awk 'NR==9'

    ENTRIES_Viction=$(curl -s "https://www.youtube.com/feeds/videos.xml?channel_id=UCWWKyYvy-FdTTANGX_Hujig" | awk -F "<media:title>|</media:title>" 'NF>1 {print $2}')
    echo "$ENTRIES_Viction" | awk 'NR==1'; echo "$ENTRIES_Viction" | awk 'NR==2'; echo "$ENTRIES_Viction" | awk 'NR==3'; echo "$ENTRIES_Viction" | awk 'NR==4'; echo "$ENTRIES_Viction" | awk 'NR==5'; echo "$ENTRIES_Viction" | awk 'NR==6'; echo "$ENTRIES_Viction" | awk 'NR==7'; echo "$ENTRIES_Viction" | awk 'NR==8'; echo "$ENTRIES_Viction" | awk 'NR==9'
#END

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