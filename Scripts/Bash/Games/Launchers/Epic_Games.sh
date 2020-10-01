 #!/usr/bin/env bash

export WINEPREFIX=$HOME/Wine/wine-pfx_lutris/wine-pfx_Epic_Games
export WINE=$HOME/Wine/wine-build_Lutris/wine-build_5.7.10/bin/wine64

_GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

cd "$HOME/Wine/wine-pfx_5.18/wine-pfx_dxvk-1.7.1-mf/drive_c/Program Files (x86)/Epic Games/Launcher/Engine/Binaries/Win64"
gamemoderun $WINE "EpicGamesLauncher.exe" -opengl -SkipBuildPatchPrereq

while pgrep -x "EpicGamesLaunch" > /dev/null; do sleep 1; done
    killall gamemoded
