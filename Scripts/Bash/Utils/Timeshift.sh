#!/bin/bash

timeshift list


while true; do
    echo -en 'Press "Enter" to Continue or "Escape" to Exit'
    echo .
    read -rsn1 input
        if [[ $input = "" ]]; then
            echo "Opening Github..."
            sleep 2
            firefox https://github.com/GoVi-48/GoVi-Arch_Linux
            exit
            
        elif [[ $input = $'\e' ]]; then
            exit
            
        else 
            echo "Invalid Key."
        fi
done




