#!/bin/bash

function Options(){
    clear
    echo -e '\n# =============== Options =============== #'
    echo -e '\n ·Press "g" to Launch Timeshift GUI'
    echo -e '\n ·Press "l" to view snapshots List'
    echo -e '\n ·Press "c" to Create Snapshot'
    echo -e '\n ·Press "d" to Delete Snapshot'
    echo -e '\n ·Press "a" to Delete ALL Snapshots'
    echo -e '\n ·Press "e" to Exit'
    echo -e '\n# ======================================= #\n'
    read -rsn1 INPUT
}
Options

function Continue(){
    echo
    read -rsn1 -p "Press any key to Continue..."; echo
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
        echo -e "\nAre you sure? y/n"
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