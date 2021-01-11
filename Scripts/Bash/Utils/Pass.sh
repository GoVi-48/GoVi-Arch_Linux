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

function Exit(){
    echo -e '\nPress "o" to show Options or "e" to Exit\n'
    read -rsn1 INPUT

        if [[ $INPUT = "o" ]]; then
            Options

        elif [[ $INPUT = "e" ]]; then
            exit

        else
            clear
            echo -e "\nInvalid Key\n"
            sleep 1
            echo -e '\nPress "o" to show Options or "e" to Exit\n'
        fi
}

while true; do

    # Password Store
    if [[ $INPUT = "p" ]]; then
        clear; echo; pass
        Exit

    # Show Password
    elif [[ $INPUT = "s" ]]; then
        clear; echo; pass
        echo -e '\nEnter site name to Show Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        gpg -d $SITE.gpg
        echo
        Exit

    # Add Password
    elif  [[ $INPUT = "a" ]]; then
        clear
        echo -e '\nEnter site name to Add Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        pass insert $SITE -m
        echo
        Exit

    # Remove Password
    elif  [[ $INPUT = "r" ]]; then
        clear; echo; pass
        echo -e '\nEnter site name to Remove Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        pass rm $SITE
        echo
        Exit

    # Modify Password
    elif [[ $INPUT = "m" ]]; then
        clear; echo; pass
        echo -e '\nEnter site name to Modify Password and press "Enter" or "Ctrl+c" to Exit\n'
        read SITE
        pass edit $SITE
        echo
        Exit

    elif [[ $INPUT = "e" ]]; then
        exit

    else
        clear
        echo -e "\nInvalid Key\n"
        sleep 1
        Exit
    fi

done
