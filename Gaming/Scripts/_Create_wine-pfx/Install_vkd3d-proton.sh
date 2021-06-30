#!/bin/bash

DIR="$(dirname "$(realpath "$0")")"
DIR_2="$(find -L "${DIR}/Setups" -type d -iname "vkd3d-proton*")"

UPDATE_vkd3d() {
    DOWNLOAD="$(curl -Ls "$(
    curl -s "https://api.github.com/repos/HansKristian-Work/vkd3d-proton/releases/latest" |
    awk -F '["]' '/"browser_download_url":/ {print $4}')" -o $DIR/Setups/vkd3d-proton-latest.tar.zst)"
    tar xvf $DIR/Setups/vkd3d-proton-latest.tar.zst -C $DIR/Setups
    rm -fv $DIR/Setups/vkd3d-proton-latest.tar.zst
}

# Check if vkd3d-proton exist
while true; do
    clear && echo
    if [ -d "${DIR_2}" ]; then
        echo 'There is already a "vkd3d-proton" folder.'
        echo 'Do you want to update or make the installation with this one?'
        read -rp 'Press "u" to Update or "t" to use this one [u/t] ' -n1 INPUT
        echo
        case $INPUT in
            [uU]*) rm -rfv "${DIR_2}" && UPDATE_vkd3d && break ;;
            [tT]*) echo -e '\n "vkd3d-proton" will not be updated.\n'; break ;;
            *) clear && echo -e '\nInvalid input, type "u" or "t"' >&2; sleep 2 ;;
        esac
    else UPDATE_vkd3d && break
    fi
done

# Export wine-px
if ! pgrep -x "Create-wine-pfx*"; then
    while true; do
        clear && echo
        read -p 'Type wine-pfx path and press Enter: ' INPUT
        if [ -f "${INPUT}/user.reg" ]; then
            export WINEPREFIX="$INPUT" && break
        else
            clear && echo "This is not a valid wine-pfx path" && sleep 3
        fi
    done
else
    export WINEPREFIX="$DIR/wine-pfx"
fi

# Install
echo -e "\nInstalling vkd3d_proton dlls, please wait...\n"

sh $DIR_2/setup_vkd3d_proton.sh install

exit