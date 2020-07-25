#!/usr/bin/env bash
 
killall polybar

lutris lutris:rungameid/7 &

sleep 2

while pgrep -x wineserver > /dev/null; do sleep 1; done

if ! pgrep -x "wineserver" > /dev/null; then
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
fi

##### Lutris Environment Variables ##### 
# RADV_PERFTEST llvm
# PROTON_NO_ESYNC 1
# +in_terminal 1
# +com_skipIntroVideo 1
# +com_skipKeyPressOnLoadScreens 1
# +com_skipSignInManager 1
