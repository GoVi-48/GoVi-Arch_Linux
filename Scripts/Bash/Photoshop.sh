#!/usr/bin/env bash

killall polybar

export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_lutris-opengl
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

cd "/Windows/Portables/Adobe/Adobe Photoshop 2020"
$WINE "Photoshop.exe"

ps -e | awk '$4 ~ "Adobe" || $4 ~ ".exe" {print $4}' | xargs kill -9 $4
sleep 1
pkill Adobe

~/Scripts/Bash/Polybar
