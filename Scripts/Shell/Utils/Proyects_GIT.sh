#!/usr/bin/env bash

# Destination
RELEVANT="$HOME/Proyects/Github/Relevant/3D Models"

# ~/.config/
rsync -arv --exclude={'.directory','.Resources','.git','README.md','*.blend*','Pants.psd'} --delete "/Media/GoVi/Proyectos/Blender/Characters/" "$RELEVANT"

# Push to Github

cd "$RELEVANT"
echo -e '\nUploading to Github...\n'; sleep 2
git add .
git commit -m "Updated"
git push -u origin main

notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" "/home Backup Complete" -t 5000 &
paplay $HOME/.local/share/sounds/cause-and-effect.ogg

while true; do
    echo -e '\nPress "Enter" to Open Github or "Escape" to Exit\n'
    read -rsn1 INPUT
        if [[ $INPUT = "" ]]; then
            echo "Opening Github..."
            sleep 2
            firefox https://github.com/GoVi-48/Relevant
            exit

        elif [[ $INPUT = $'\e' ]]; then
            exit

        else
            echo "Invalid Key"
        fi
done

