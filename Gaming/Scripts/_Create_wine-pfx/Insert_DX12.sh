#!/bin/bash

DIR=$(dirname "$(realpath "$0")")

DOWNLOAD="$(curl -Ls "$(
curl -s "https://api.github.com/repos/HansKristian-Work/vkd3d-proton/releases/latest" |
awk -F '["]' '/"browser_download_url":/ {print $4}')"
-o $DIR/vkd3d-proton.tar.zst)"

tar xvf $DIR/vkd3d-proton.tar.zst
rm -fv $DIR/vkd3d-proton.tar.zst

DIR_2="$(find -L "${DIR}" -type d -iname "vkd3d-proton*")"
cd "$DIR_2"

while true; do
    echo && clear
    read -p 'Type wine-pfx path and press Enter: ' INPUT
    if [ -f "${INPUT}/user.reg" ]; then
        export WINEPREFIX="$INPUT" && break
    else
        clear && echo "This is not a valid wine-pfx" && sleep 3
    fi
done

echo -e "\nInstalling vkd3d_proton dlls, please wait...\n"

sh setup_vkd3d_proton.sh install

echo -e "\nALL DONE\n"

