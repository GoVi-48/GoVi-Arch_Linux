#!/usr/bin/env bash

rm -rfv ~/Backups/Kodi/Backups/Builds/Current/.kodi

cp -rfv ~/.kodi ~/Backups/Kodi/Backups/Builds/Current

cd ~/Backups/Kodi/Backups/Builds/Current/.kodi/

zip -r $HOME/Escritorio/Kodi-GoVi_Build.zip "addons" "media" "userdata" 

mv ~/Escritorio/Kodi-GoVi_Build.zip ~/Dropbox

kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "Complete" 8 && paplay $HOME/.local/share/sounds/cause-and-effect.ogg

while true; do
    echo -e '\nPress "Enter" to Upload to Dropbox or "Escape" to Exit\n'
    read -rsn1 INPUT
        if [[ $INPUT = "" ]];then
            echo "Opening Dropbox..."
            sleep 2
            dropbox &
            exit
            
        elif [[ $INPUT = $'\e' ]]; then
            exit
            
        else 
            echo "Invalid Key"
        fi
done

