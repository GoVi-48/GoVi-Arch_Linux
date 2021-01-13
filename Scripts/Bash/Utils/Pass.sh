#!/bin/bash

# ID usuario
# GoVi_48 alexpeed48@gmail.com
# Tricomas48

# Colors
B=$(tput bold) # Bold
R=$(tput rmso) # Reset

function Options(){
    clear
    echo -e "\n$B# =============== Options =============== #$R"
    echo -e "\n ·Press \"$B"p"$R\" to show $B"Password Store"$R"
    echo -e "\n ·Press \"$B"s"$R\" to $B"Show"$R the Password of a site"
    echo -e "\n ·Press \"$B"a"$R\" to $B"Add"$R a Password to a site"
    echo -e "\n ·Press \"$B"r"$R\" to $B"Remove"$R a Password of a site"
    echo -e "\n ·Press \"$B"m"$R\" to $B"Modify"$R Password of a site"
    echo -e "\n ·Press \"$B"e"$R\" to $B"Exit"$R"
    echo -e "\n$B# ======================================= #$R\n"
    read -rsn1 INPUT
}
Options

function Continue(){
    read -rsn1 -p "Press any key to continue"; echo
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
        echo -e "\nInvalid Key\n"
        sleep 1
        Options
    fi

done
