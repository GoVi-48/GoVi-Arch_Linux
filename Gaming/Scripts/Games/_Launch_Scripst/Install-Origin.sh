#!/bin/bash

# Game Directory
DIR="$(dirname "$(realpath "$0")")"

# Wine Directories
WINE="$DIR/wine"
WINEPREFIX="$DIR/wine-pfx"

# Environment
export STAGING_SHARED_MEMORY=0
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$DIR/wine-pfx/drive_c/Program Files (x86)/Origin/Cache"
export WINEDLLOVERRIDES="nvapi,nvapi64="
export WINEFSYNC=1
export MANGOHUD=0
export ENABLE_VKBASALT=0

# ======================================================================== #

# Installer
cd "$DIR"
WINEPREFIX="$WINEPREFIX" "$WINE" ./OriginThinSetup.exe

# ======================================================================== #
