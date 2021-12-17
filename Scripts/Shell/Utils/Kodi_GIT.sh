#!/usr/bin/env bash

rsync -arv --delete ~/.kodi/ ~/Backups/Kodi/Backups/Builds/Current/.kodi/

cd ~/Backups/Kodi/Builds/Current/.kodi/

zip -r $HOME/Kodi-GoVi_Build.zip "addons" "media" "userdata" 

mv ~/Kodi-GoVi_Build.zip ~/Shared/Dropbox

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

