 #!/usr/bin/env bash
 
_GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=0

export WINEPREFIX="/home/$USER/Wine/wine_Lutris/wine-pfx_Epic_Games"
export WINE="/home/$USER/Wine/wine_Lutris/wine-build_5.21/bin/wine64"

cd "/home/$USER/Wine/wine_Lutris/wine-pfx_Epic_Games/drive_c/Program Files (x86)/Epic Games/Launcher/Engine/Binaries/Win64"
gamemoderun $WINE "EpicGamesLauncher.exe" -opengl -SkipBuildPatchPrereq

while pgrep -x "EpicGamesLaunch" > /dev/null; do sleep 1; done
    killall gamemoded
