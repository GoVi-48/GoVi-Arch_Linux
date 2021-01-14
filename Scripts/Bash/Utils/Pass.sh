#!/bin/bash

# ID usuario
# GoVi_48 alexpeed48@gmail.com
# Tricomas48

# Colors
export tput init
BOLD=`tput bold` # Bold
OFFBOLD=`tput sgr0` # Turn off all attributes

function Options(){
    clear
    echo -e "\n${BOLD}# =============== Options =============== #${OFFBOLD}"
    echo -e "\n ·Press ${BOLD}\"p\"${OFFBOLD} to show ${BOLD}Password Store${OFFBOLD}"
    echo -e "\n ·Press ${BOLD}\"s\"${OFFBOLD} to ${BOLD}Show${OFFBOLD} the Password of a site"
    echo -e "\n ·Press ${BOLD}\"a\"${OFFBOLD} to ${BOLD}Add${OFFBOLD} a Password to a site"
    echo -e "\n ·Press ${BOLD}\"r\"${OFFBOLD} to ${BOLD}Remove${OFFBOLD} a Password of a site"
    echo -e "\n ·Press ${BOLD}\"m\"${OFFBOLD} to ${BOLD}Modify${OFFBOLD} Password of a site"
    echo -e "\n ·Press ${BOLD}\"e\"${OFFBOLD} to ${BOLD}Exit${OFFBOLD}"
    echo -e "\n${BOLD}# ======================================= #${OFFBOLD}\n"
    read -rsn1 INPUT
}
Options

function Continue(){
    read -rsn1 -p "$(echo -e "\nPress any key to Continue...")"
    Options
}

cd ~/.password-store/

while true; do

    # Password Store
    if [[ $INPUT = "p" ]]; then
        clear; echo; pass
        Continue

    # Show Password
    elif [[ $INPUT = "s" ]]; then
        clear; echo; pass
        echo -e '\nType site name to Show Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        gpg -d $SITE.gpg
        Continue

    # Add Password
    elif  [[ $INPUT = "a" ]]; then
        clear
        echo -e '\nType site name to Add Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        pass insert $SITE -m
        Continue

    # Remove Password
    elif  [[ $INPUT = "r" ]]; then
        clear; echo; pass
        echo -e '\nType site name to Remove Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        pass rm $SITE
        Continue

    # Modify Password
    elif [[ $INPUT = "m" ]]; then
        clear; echo; pass
        echo -e '\nType site name to Modify Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        pass edit $SITE
        Continue

    elif [[ $INPUT = "e" ]]; then
        exit

    else
        clear
        echo -e "\nInvalid Key\n" &
        sleep 2
        Options
    fi

done
