#!/bin/bash

LIBRARIES="d3dx9 d3dcompiler_43 d3dcompiler_47"
WIN_VER="win10"

# Directories
DIR="$(dirname "$(realpath "$0")" | sed -s 's/Install_Scripts//g')"

[ ! -d "${DIR}wine-build" ] && mkdir -p "${DIR}wine-build"

while true; do
    if [ ! -f "${DIR}wine" ]; then
        WINE=$(find -L "${DIR}wine-build" -type f -iname "wine") 2> /dev/null
        export WINE="$WINE"
        ln -sf "$WINE" "$DIR" > /dev/null 2>&1
        echo -e "\nFolder wine-build is empty or have more than 1 wine version... "
        read -rsn1 -p "$(echo -e "\nCopy folder of wine inside or create a symlink to it and press any key to Continue...")"; echo ""
    else
        WINE=$(find -L "${DIR}wine-build" -type f -iname "wine") 2> /dev/null
        export WINE="$WINE"
        ln -sf "$WINE" "$DIR" > /dev/null 2>&1
        break
    fi
done

# Create WINEPREFIX
clear
echo -e "\nCreating Wine Prefix, please wait...\n"

export WINEPREFIX="${DIR}wine-pfx"
"$WINE" winecfg > /dev/null 2>&1 &

while ! pgrep -x "winecfg.exe" > /dev/null; do sleep 1; done
sleep 2 && killall winecfg.exe
while [ ! -f "${DIR}wine-pfx/user.reg" ] > /dev/null; do sleep 1; done

# Functions
MF() {
    while true; do
        echo -e '\n-Do you want to install "Media Files"? [y/n]'
        read -rsn1 INPUT

        if [[ $INPUT == "y" ]] || [[ $INPUT == "Y" ]]; then
            echo ""
            ./MF/mf-install.sh
            break

        elif [[ $INPUT == "n" ]] || [[ $INPUT == "N" ]]; then
            echo -e '\n "Media Files" will not be installed\n'
            break

        else
            echo -e "\n Invalid Key\n"
        fi
    done
}


DXVK() {
    while true; do
        echo -e '\n-Do you want to install "DXVK"? [y/n]'
        read -rsn1 INPUT

        if [[ $INPUT == "y" ]] || [[ $INPUT == "Y" ]]; then
            echo ""
            ./DXVK-1.7.3/setup_dxvk.sh install
            break

        elif [[ $INPUT == "n" ]] || [[ $INPUT == "N" ]]; then
            echo -e '\n "DXVK" will not be installed\n'
            break

        else
            echo -e "\n Invalid Key\n"
        fi
    done
}

EXTRA_LIBRARIES() {
    while true; do
        echo -e '\n-Do you want to install "Extra dll libraries"? [y/n]'
        read -rsn1 INPUT

        if [[ $INPUT == "y" ]] || [[ $INPUT == "Y" ]]; then
            echo ""
            winetricks $LIBRARIES
            break

        elif [[ $INPUT == "n" ]] || [[ $INPUT == "N" ]]; then
            echo -e '\n "Extra dll libraries" will not be installed\n'
            break

        else
            echo -e "\n Invalid Key\n"
        fi
    done
}

# Install
cd "${DIR}wine-pfx/drive_c/windows/Fonts" && for i in /usr/share/fonts/**/*.{ttf,otf}; do ln -sf "$i"; done > /dev/null 2>&1
cd "${DIR}Install_Scripts/"
chmod +x "./winetricks"
winetricks corefonts
winetricks --force vcrun2010 vcrun2012 vcrun2013 vcrun2015 vcrun2017 vcrun2019

"$WINE" msiexec /i "./xnafx40_redist.msi" > /dev/null 2>&1
"$WINE" "./oalinst.exe" > /dev/null 2>&1

MF
DXVK
EXTRA_LIBRARIES

winetricks $WIN_VER

echo -e "\n ALL DONE\n"

exit
