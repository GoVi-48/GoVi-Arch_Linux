#!/bin/bash

ping -c2 google.com || echo "You need Internet connection to run this script" || exit

# Variables
FONTS="corefonts"
#VCRUN=(vcrun2010 vcrun2012 vcrun2013 vcrun2019)
VCRUN="vcrun2010 vcrun2012 vcrun2013 vcrun2019"
LIBRARIES="gdipl msxml3 msxml6 atmlib"
WIN_VER="win10"

# Directory
DIR="$(dirname "$(realpath "$0")")"

# Check if wine-pfx exist
if [ -d "${DIR}/wine-pfx" ]; then
    echo -e "\nThere is already a valid wine-pfx\n"
    echo -e "Do you want to make a new wine-prefix or base it on this one?\n"
    while true; do
        echo
        read -rp 'Press "n" to New "o" to Overwrite or "e" to Exit' -n1 INPUT
        echo
        case $INPUT in
            [nN]*) rm -rf "${DIR}/wine-pfx"; break ;;
            [oO]*) break ;;
            [eE]*) echo -e "\nExiting..."; sleep 2; exit ;;
            *) echo -e '\nInvalid input.' >&2; sleep 2; clear ;;
        esac
    done
fi

# Check if wine-build exist
mkdir -p "${DIR}/wine-build"

while true; do
    WINE=$(find -L "${DIR}/wine-build" -type f -iname "wine") 2>/dev/null
    ln -sf "$WINE" "${DIR}/wine" >/dev/null 2>&1
    if [ ! -f "${DIR}/wine" ]; then
        echo -e "\nFolder wine-build is empty or have more than 1 wine version... "
        read -rn1 -p "$(echo -e "\nCopy folder of wine inside or create a symlink to it and press any key to Continue...")"; echo
    else
        export WINE="$WINE"
        break
    fi
done

# Create WINEPREFIX
clear
echo -e "\nCreating Wine Prefix, please wait...\n"

WINE="$DIR/wine"
export WINEPREFIX="${DIR}/wine-pfx"
"$WINE" winecfg > /dev/null 2>&1 &

while ! pgrep -x "winecfg.exe" >/dev/null; do sleep 1; done
while [ ! -f "${DIR}/wine-pfx/user.reg" ]; do sleep 1; done
sleep 5 && killall winecfg.exe

export PATH=$PATH:$DIR/Setups/

# Functions
VC_RUN() {
#    for i in ${VCRUN[*]}; do
#        sh $DIR/Setups/winetricks "$i"
#    done

winetricks $VCRUN
}

EXTRA_LIBS() {
    while true; do
        echo
        read -rp '-Do you want to install "Extra dll libraries"? [y/n]' -n1 INPUT
        echo
        case $INPUT in
            [yY]*) winetricks $LIBRARIES; break ;;
            [nN]*) echo -e '\nExtra dll libraries" will not be installed\n'; break ;;
            *) echo -e '\nInvalid input, type "y" or "n"' >&2; sleep 2 ;;
        esac
    done
}

DXVK() {
    while true; do
        echo
        read -rp 'Do you want to install "DXVK"? [y/n]' -n1 INPUT
        echo
        case $INPUT in
            [yY]*) sh "$DIR"/Install_DXVK.sh ; break ;;
            [nN]*) echo -e '\n "DXVK" will not be installed\n' ; break ;;
            *) echo -e '\nInvalid input, type "y" or "n"' >&2; sleep 2 ;;
        esac
    done
}

# Install
cd "${DIR}/wine-pfx/drive_c/windows/Fonts" && for i in /usr/share/fonts/**/*.{ttf,otf}; do ln -sf "$i"; done >/dev/null 2>&1
cd "${DIR}/Setups/"

chmod +x "./winetricks"
#winetricks $FONTS
VC_RUN
EXTRA_LIBS
DXVK

[ ! -d "${DIR}/wine-pfx/drive_c/Program Files (x86)/OpenAL" ] &&
    "$WINE" "./oalinst.exe" >/dev/null 2>&1


#winetricks d3dx10 d3dx11_42 d3dx11_43
#winetricks dotnet48
#winetricks winegstreamer=disabled
#winetricks nvapi=disabled nvapi64=disabled
#winetricks nocrashdialog d3dcompiler_43 d3dcompiler_47 d3dx9
#winetricks d3d10=disabled d3d10_1=disabled d3d10core=disabled d3d11=disabled
#winetricks d3d11=native dxgi=native
winetricks fontsmooth=rgb
winetricks $WIN_VER

echo -e "\n ALL DONE"
read -rsn1 -p "$(echo -e "\nPress any key to open wine prefix config...\n")"
"$WINE" winecfg &
exit