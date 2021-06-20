#!/bin/bash

# Directory
DIR="$(dirname "$(realpath "$0")")"

# Check if wine-pfx exist
while true; do
    [ -d "$DIR"/wine-pfx ] && break ||
    read -rn1 -p "$(echo -e "\nThere is not a wine-prefix to install DXVK dlls. \nPress any key to exit...\n")"
    exit
done

WINEPREFIX="$DIR"/wine-pfx
export WINEPREFIX="$WINEPREFIX"

# Check if dxvk exist
if [ ! -d "$DIR"/Setups/dxvk-1.9 ]; then
    wget -P  "$DIR"/Setups "https://github.com/doitsujin/dxvk/releases/download/v1.9/dxvk-1.9.tar.gz"
    tar xvzf "$DIR"/Setups/dxvk-1.9.tar.gz -C "$DIR"/Setups
    rm -rfv "$DIR"/Setups/dxvk-1.9.tar.gz
fi

sh "$DIR"/Setups/dxvk-1.9/setup_dxvk.sh install

exit
