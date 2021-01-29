#!/bin/bash

# Game Directory
DIR="$(dirname "$(realpath "$0")")"

# Wine Directories
WINE="$DIR/wine"
WINEPREFIX="$DIR/wine-pfx"

# Environment
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$DIR/wine-pfx/drive_c/Program Files (x86)/Epic Games/Cache"
export WINEDLLOVERRIDES="libEGL=n"
export WINEFSYNC=1
export MANGOHUD=0
export ENABLE_VKBASALT=0

# ======================================================================== #

# Installer
cd "$DIR"
[ ! -d "${DIR}/wine-pfx/drive_c/Program Files (x86)/Epic Games" ] &&
WINEPREFIX="$WINEPREFIX" "$WINE" msiexec /i ./EpicInstaller-10.19.2.msi -opengl -SkipBuildPatchPrereq

WINEPREFIX="$WINEPREFIX" "$WINE" "$DIR"/wine-pfx/drive_c/"Program Files (x86)/Epic Games"/Launcher/Portal/Binaries/Win32/EpicGamesLauncher.exe -opengl -SkipBuildPatchPrereq


# ======================================================================== #
