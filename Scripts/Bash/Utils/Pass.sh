#!/bin/bash

# ID usuario
# GoVi_48 alexpeed48@gmail.com
# Tricomas48

cd ~/.password-store/


function Options(){
    clear
    echo -e '\n# =============== Options =============== #'
    echo -e '\n ·Press "p" to show Password Store'
    echo -e '\n ·Press "s" to Show the Password of a site'
    echo -e '\n ·Press "a" to Add a Password to a site'
    echo -e '\n ·Press "r" to Remove a Password of a site'
    echo -e '\n ·Press "m" to Modify Password of a site'
    echo -e '\n ·Press "e" to Exit'
    echo -e '\n# ======================================= #\n'
    read -rsn1 INPUT
}
Options

function Continue(){
    read -rsn1 -p "Press any key to continue"; echo
    Options
}

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
        echo -e "\nInvalid Key\n"
        sleep 1
        Options
    fi

done
