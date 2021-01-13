#!/bin/bash

# Colors
B=$(tput bold) # Bold
R=$(tput rmso) # Reset

function Options(){
    clear
    echo -e "\n$B# =============== Options =============== #$R"
    echo -e "\n ·Press \"$B"g"$R\" to Launch Timeshift $B"GUI"$R"
    echo -e "\n ·Press \"$B"l"$R\" to view snapshots $B"List"$R"
    echo -e "\n ·Press \"$B"c"$R\" to $B"Create"$R Snapshot"
    echo -e "\n ·Press \"$B"d"$R\" to $B"Delete"$R Snapshot"
    echo -e "\n ·Press \"$B"a"$R\" to $B"Delete ALL"$R Snapshots"
    echo -e "\n ·Press \"$B"e"$R\" to $B"Exit"$R"
    echo -e "\n$B# ======================================= #$R\n"
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