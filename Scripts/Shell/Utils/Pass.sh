#!/bin/bash

# Colors
export tput init
BOLD=`tput bold`
OFFBOLD=`tput sgr0` # Turn off all attributes
#Background
BLACK_BG=`tput setab 0`
BLUE_BG=`tput setab 1`
GREEN_BG=`tput setab 2`
CYAN_BG=`tput setab 3`
RED_BG=`tput setab 4`
MAGENTA_BG=`tput setab 5`
YELLOW_BG=`tput setab 6`
WHITE_BG=`tput setab 7`
# Foreground
BLACK_FG=`tput setaf 0`
BLUE_FG=`tput setaf 1`
GREEN_FG=`tput setaf 2`
CYAN_FG=`tput setaf 3`
RED_FG=`tput setaf 4`
MAGENTA_FG=`tput setaf 5`
YELLOW_FG=`tput setaf 6`
WHITE_FG=`tput setaf 7`

# Menu
MENUBAR(){
    echo '
    ██████╗  █████╗ ███████╗███████╗
    ██╔══██╗██╔══██╗██╔════╝██╔════╝
    ██████╔╝███████║███████╗███████╗
    ██╔═══╝ ██╔══██║╚════██║╚════██║
    ██║     ██║  ██║███████║███████║
    ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝
    '
}

MENU_1(){
    clear && MENUBAR
    echo "${BOLD}  ➤ Password Store${OFFBOLD}"
    echo "    Show the Password of a site"
    echo "    Add a Password to a site"
    echo "    Remove a Password of a site"
    echo "    Modify Password of a site"
    echo "    Exit"
    tput civis
}
MENU_2(){
    clear && MENUBAR
    echo "    Password Store"
    echo "${BOLD}  ➤ Show the Password of a site${OFFBOLD}"
    echo "    Add a Password to a site"
    echo "    Remove a Password of a site"
    echo "    Modify Password of a site"
    echo "    Exit"
    tput civis
}
MENU_3(){
    clear && MENUBAR
    echo "    Password Store"
    echo "    Show the Password of a site"
    echo "${BOLD}  ➤ Add a Password to a site${OFFBOLD}"
    echo "    Remove a Password of a site"
    echo "    Modify Password of a site"
    echo "    Exit"
    tput civis
}
MENU_4(){
    clear && MENUBAR
    echo "    Password Store"
    echo "    Show the Password of a site"
    echo "    Add a Password to a site"
    echo "${BOLD}  ➤ Remove a Password of a site${OFFBOLD}"
    echo "    Modify Password of a site"
    echo "    Exit"
    tput civis
}
MENU_5(){
    clear && MENUBAR
    echo "    Password Store"
    echo "    Show the Password of a site"
    echo "    Add a Password to a site"
    echo "    Remove a Password of a site"
    echo "${BOLD}  ➤ Modify Password of a site${OFFBOLD}"
    echo "    Exit"
    tput civis
}
MENU_6(){
    clear && MENUBAR
    echo "    Password Store"
    echo "    Show the Password of a site"
    echo "    Add a Password to a site"
    echo "    Remove a Password of a site"
    echo "    Modify Password of a site"
    echo "${BOLD}  ➤ Exit${OFFBOLD}"
    tput civis
}

Continue(){
    read -rsn1 -p "$(echo -e "\nPress any key to Continue...")"
    MENU_1
}

# Output
MENU_1
declare -i OUTPUT=1
while true; do
    read -rsn1 INPUT
    case $INPUT in
        J|j) OUTPUT="$(( $OUTPUT + 1 ))";;
        K|k) OUTPUT="$(( $OUTPUT - 1 ))";;
        P|p) OUTPUT="1" && break;;
        S|s) OUTPUT="2" && break;;
        A|a) OUTPUT="3" && break;;
        R|r) OUTPUT="4" && break;;
        M|m) OUTPUT="5" && break;;
        E|e) OUTPUT="6" && break;;
        "") break;;
        *) echo 'Bad key, use "j for Up" or "k for Down"' && sleep 1;;
    esac

    if [ $OUTPUT -eq 1 ]; then
        MENU_1
    elif [ $OUTPUT -eq 2 ]; then
        MENU_2
    elif [ $OUTPUT -eq 3 ]; then
        MENU_3
    elif [ $OUTPUT -eq 4 ]; then
        MENU_4
    elif [ $OUTPUT -eq 5 ]; then
        MENU_5
    elif [ $OUTPUT -eq 6 ]; then
        MENU_6
    elif [ $OUTPUT -gt 6 ]; then
        OUTPUT="1" && clear && MENU_1
    elif [ $OUTPUT -lt 1 ]; then
        OUTPUT="6" && clear && MENU_6
    elif [ $OUTPUT = "" ]; then
        break
    fi
done

# Launch
cd ~/.password-store/

# Password Store
if [[ $OUTPUT = "1" ]]; then
    clear; echo; pass
    Continue

# Show Password
elif [[ $OUTPUT = "2" ]]; then
    clear; echo; pass
    echo -e '\nType site name to Show Password and press "Enter" or "Ctrl+c" to Exit\n'
    read SITE
    gpg -d $SITE.gpg
    Continue

# Add Password
elif  [[ $OUTPUT = "3" ]]; then
    clear
    echo -e '\nType site name to Add Password and press "Enter" or "Ctrl+c" to Exit\n'
    read SITE
    pass insert $SITE -m
    Continue

# Remove Password
elif  [[ $OUTPUT = "4" ]]; then
    clear; echo; pass
    echo -e '\nType site name to Remove Password and press "Enter" or "Ctrl+c" to Exit\n'
    read SITE
    pass rm $SITE
    Continue

# Modify Password
elif [[ $OUTPUT = "5" ]]; then
    export EDITOR=nvim
    clear; echo; pass
    echo -e '\nType site name to Modify Password and press "Enter" or "Ctrl+c" to Exit\n'
    read SITE
    pass edit $SITE
    Continue

# Exit
elif [[ $OUTPUT = "6" ]]; then
    clear; echo; exit
else
    clear && echo -e "\nInvalid Key\n" && sleep 1
    Continue
fi

tput cnorm
