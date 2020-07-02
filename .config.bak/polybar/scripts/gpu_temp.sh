#!/usr/bin/env bash

temp=$(cat /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/hwmon/hwmon2/temp1_input | cut -c -2)

if [ $temp > 30 ];then
    echo  %{F#27ae60}"$temp"°C%{F-}
    
elif [ $temp  > 50 ];then
    echo 🔥 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp  > 30 ];then
    echo 🔥 %{F#0095ff}"$temp"°C%{F-}
    
fi
