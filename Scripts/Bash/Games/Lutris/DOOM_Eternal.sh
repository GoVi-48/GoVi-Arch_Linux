#!/usr/bin/env bash
 
qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

lutris lutris:rungameid/7 &

sleep 2

while pgrep -x "DOOMEternalx64vk.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit

##### Lutris Environment Variables ##### 
# RADV_PERFTEST llvm
# PROTON_NO_ESYNC 1
# +in_terminal 1
# +com_skipIntroVideo 1
# +com_skipKeyPressOnLoadScreens 1
# +com_skipSignInManager 1
