#!/bin/bash

# Directory
DIR="$(dirname "$(realpath "$0")")"

# Check if wine-pfx exist
while true; do
    [ -d "$DIR"/wine-pfx ] && break ||
    read -rn1 -p "$(echo -e "\nThere is not a wine-prefix to install MF files. \nPress any key to exit...\n")"
    exit
done

WINEPREFIX="$DIR"/wine-pfx
export WINEPREFIX="$WINEPREFIX"

# Check if MF exist
if [ ! -d "$DIR"/Setups/MF ]; then
    git clone https://github.com/z0z0z/mf-install.git  "$DIR"/Setups/MF
fi

sh "$DIR"/Setups/MF/mf-install.sh

exit