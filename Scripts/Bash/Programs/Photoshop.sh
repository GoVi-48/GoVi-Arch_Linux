#!/usr/bin/env bash

export WINEPREFIX="$HOME/Wine/wine_Lutris/wine-pfx_Photoshop"
export WINE="$HOME/Wine/wine_Lutris/wine-build_5.7.11/bin/wine64"

cd "$HOME/Programas/Adobe/Adobe Photoshop 2020"
$WINE "Photoshop.exe"

ps -e | awk '$4 ~ "Adobe" || $4 ~ ".exe" {print $4}' | xargs kill -9 $4
sleep 1
pkill Adobe
