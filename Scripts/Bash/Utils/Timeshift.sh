#!/bin/bash

# Colors
export tput init
BOLD=`tput bold` # Bold
OFFBOLD=`tput sgr0` # Turn off all attributes

function Options(){
    clear
    echo -e "\n# =============== $BOLD"Options"$OFFBOLD =============== #"
    echo -e "\n ·Press $BOLD"\"g\""$OFFBOLD to Launch Timeshift $BOLD"GUI"$OFFBOLD"
    echo -e "\n ·Press $BOLD"\"l\""$OFFBOLD to view snapshots $BOLD"List"$OFFBOLD"
    echo -e "\n ·Press $BOLD"\"c\""$OFFBOLD to $BOLD"Create"$OFFBOLD Snapshot"
    echo -e "\n ·Press $BOLD"\"d\""$OFFBOLD to $BOLD"Delete"$OFFBOLD Snapshot"
    echo -e "\n ·Press $BOLD"\"a\""$OFFBOLD to $BOLD"Delete ALL"$OFFBOLD Snapshots"
    echo -e "\n ·Press $BOLD"\"e\""$OFFBOLD to $BOLD"Exit"$OFFBOLD"
    echo -e "\n# ======================================= #\n"
    read -rsn1 INPUT
}
Options

function Continue(){
    read -rsn1 -p "$(echo -e "\nPress any key to Continue...")"
    Options
}

while true; do

    if [[ $INPUT = "g" ]]; then
        sudo timeshift-launcher 2> /dev/null
        Continue

    elif [[ $INPUT = "l" ]]; then
        clear
        sudo timeshift --list 2> /dev/null
        Continue

    elif [[ $INPUT = "c" ]]; then
        sudo timeshift --create 2> /dev/null
        Continue

    elif [[ $INPUT = "d" ]]; then
        sudo timeshift --list 2> /dev/null
        echo -e '\nType Snapshot Name to Delete and press "Enter" or "Ctrl+c" to Exit\n'
        read SNAPSHOT
        sudo timeshift --delete  --snapshot $SNAPSHOT 2> /dev/null
        Continue

    elif [[ $INPUT = "a" ]]; then
        echo -e "\nAre you sure? [y/n]"
        read -rsn1 YN

        if [[ $YN = "y" ]]; then
            sudo timeshift --delete-all 2> /dev/null
            Continue

        elif [[ $YN = "n" ]]; then
            exit
        fi

    elif [[ $INPUT = "e" ]]; then
        exit

    else
        echo "Invalid Key."
        sleep 2
        Options
    fi

done