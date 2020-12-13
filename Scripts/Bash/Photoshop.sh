#!/usr/bin/env bash

export WINEPREFIX=~/Wine/wine_5.22/wine-pfx_PS
export WINE=~/Wine/wine_5.22/wine-tkg/usr/bin/wine64

cd "/Windows/Portables/Adobe/Adobe Photoshop 2020"
$WINE "Photoshop.exe"

ps -e | awk '$4 ~ "Adobe" || $4 ~ ".exe" {print $4}' | xargs kill -9 $4
sleep 1
pkill Adobe
