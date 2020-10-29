 #!/usr/bin/env bash
 
export WINEPREFIX=$HOME/Wine/wine-pfx_lutris/wine-pfx_Epic_Games
export WINE=$HOME/Wine/wine-build_Lutris/wine-build_5.7.11/bin/wine64

_GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

ENABLE_VKBASALT=0

cd "$HOME/Wine/wine-pfx_lutris/wine-pfx_Epic_Games/drive_c/Program Files (x86)/Epic Games/Launcher/Engine/Binaries/Win64"
gamemoderun $WINE "EpicGamesLauncher.exe" -opengl -SkipBuildPatchPrereq

while pgrep -x "EpicGamesLaunch" > /dev/null; do sleep 1; done
    killall gamemoded
