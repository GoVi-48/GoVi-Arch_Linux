#!/bin/bash

# Variables
FONTS=(corefonts)
VCRUN=(vcrun2019)
LIBRARIES=()
WIN_VER="win10"

ping -c2 google.com || echo "You need Internet connection to run this script." || exit

# Edit script
DIR=$(dirname "$(realpath "$0")")
while true; do
    clear && echo
    read -rp 'Do you want to edit this script? [y/n] ' -n1 INPUT
    echo
    case $INPUT in
        [yY]*) nvim $DIR/Create-wine-pfx.sh; clear && break ;;
        [nN]*) clear && echo -e '\nThe script will not be edited.\n'; break ;;
        *) clear && echo -e '\nInvalid input, type "y" or "n"' >&2; sleep 2 ;;
    esac
done

# Update winetricks
while true; do
    clear && echo
    read -rp 'Do you want to update winetricks? [y/n] ' -n1 INPUT
    echo
    case $INPUT in
        [yY]*) sudo winetricks --self-update; clear && break ;;
        [nN]*) clear && break ;;
        *) clear && echo -e '\nInvalid input, type "y" or "n"' >&2; sleep 2 ;;
    esac
done

# Check if wine-pfx exist
if [ -d "${DIR}/wine-pfx" ]; then
    echo -e "\nThere is already a valid wine-pfx.\n"
    echo -e "Do you want to make a new wine-prefix or base it on this one?\n"
    while true; do
        read -rp 'Press "n" to New "o" to Overwrite or "e" to Exit ' -n1 INPUT
        echo
        case $INPUT in
            [nN]*) rm -rf "${DIR}/wine-pfx"; clear && break ;;
            [oO]*) clear && break ;;
            [eE]*) echo -e "\nExiting..."; sleep 2; exit ;;
            *) echo -e '\nInvalid input' >&2; sleep 2; clear ;;
        esac
    done
fi

# Check if wine-build exist
echo -e "\nIf you want to create the wine-pfx with another wine version just create a wine simlink to it in the script directory."
if [ -f "${DIR}/wine" ]; then
    WINE=$DIR/wine
else
    WINE=/usr/bin/wine
fi

# Create WINEPREFIX
echo -e "\nCreating Wine Prefix, please wait...\n"
echo -e "Wine config window should pop up, let it close alone.\n"

export WINEPREFIX="${DIR}/wine-pfx"
$WINE winecfg > /dev/null 2>&1 &

while ! pgrep -x "winecfg.exe" >/dev/null; do sleep 1; done
while [ ! -f "${DIR}/wine-pfx/user.reg" ]; do sleep 1; done
sleep 5 && killall winecfg.exe


# Functions
FONT() {
    clear && echo -e "\nInstalling Fonts, please wait...\n" && sleep 2
    for i in ${FONTS[*]}; do winetricks "$i"; done
}

VC_RUN() {
    clear && echo -e "\nInstalling VC Runtime, please wait...\n" && sleep 2
    for i in ${VCRUN[*]}; do winetricks "$i"; done
}

EXTRA_LIBS() {
    clear && echo -e "\nInstalling Libraries, please wait...\n" && sleep 2
    for i in ${LIBRARIES[*]}; do winetricks "$i"; done
}

DXVK() {
    while true; do
        clear && echo
        read -rp 'Do you want to install "DXVK"? [y/n] ' -n1 INPUT
        echo
        case $INPUT in
            [yY]*) sh "$DIR"/Install_DXVK.sh ; break ;;
            [nN]*) echo -e '\n "DXVK" will not be installed.\n' ; break ;;
            *) echo -e '\nInvalid input, type "y" or "n"' >&2; sleep 2 ;;
        esac
    done
}

VKD3D() {
    while true; do
        clear && echo
        read -rp 'Do you want to install "vkd3d-proton"? [y/n] ' -n1 INPUT
        echo
        case $INPUT in
            [yY]*) sh "$DIR"/Install_vkd3d-proton.sh ; break ;;
            [nN]*) echo -e '\n "vkd3d-proton" will not be installed.\n' ; break ;;
            *) echo -e '\nInvalid input, type "y" or "n"' >&2; sleep 2 ;;
        esac
    done
}

# Install
cd "${DIR}/wine-pfx/drive_c/windows/Fonts" && for i in /usr/share/fonts/**/*.{ttf,otf}; do ln -sf "$i"; done >/dev/null 2>&1
cd ~/

FONT
VC_RUN
EXTRA_LIBS
notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" "Instal DXVK?" -t 5000 &
paplay $HOME/.local/share/sounds/cause-and-effect.ogg
DXVK
notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" "Instal VKD3D?" -t 5000 &
paplay $HOME/.local/share/sounds/cause-and-effect.ogg
VKD3D

[ ! -d "${DIR}/wine-pfx/drive_c/Program Files (x86)/OpenAL" ] &&
    $WINE "$DIR/Setups/oalinst.exe" >/dev/null 2>&1

# Extras
#winetricks vcrun2005 vcrun2008 vcrun2010 vcrun2012 vcrun2013 vcrun2019
#winetricks d3dx10 d3dx11_42 d3dx11_43
#winetricks dotnet48
#winetricks winegstreamer=disabled
#winetricks nvapi=disabled nvapi64=disabled
#winetricks nocrashdialog d3dcompiler_43 d3dcompiler_47 d3dx9
#winetricks d3d10=disabled d3d10_1=disabled d3d10core=disabled d3d11=disabled
#winetricks d3d11=native dxgi=native
#winetricks gdiplus msxml3 msxml6 atmlib

winetricks fontsmooth=rgb
winetricks $WIN_VER

echo -e "\n ALL DONE"
notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" "All Done" -t 5000 &
paplay $HOME/.local/share/sounds/cause-and-effect.ogg
read -rsn1 -p "$(echo -e "\nPress any key to open wine prefix config...\n")"
$WINE winecfg &
exit
