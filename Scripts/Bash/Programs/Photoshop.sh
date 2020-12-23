#!/usr/bin/env bash

export WINEPREFIX=/home/$USER/Wine/wine_Lutris/wine-pfx_PS
export WINE=/home/$USER/Wine/wine_Lutris/wine-build_5.21/bin/wine64

cd "/Windows/Portables/Adobe/Adobe Photoshop 2020"
$WINE "Photoshop.exe"

ps -e | awk '$4 ~ "Adobe" || $4 ~ ".exe" {print $4}' | xargs kill -9 $4
sleep 1
pkill Adobe
