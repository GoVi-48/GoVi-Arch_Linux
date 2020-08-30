#!/usr/bin/env bash

temp=$(cat /sys/devices/platform/it87.2608/hwmon/hwmon2/temp1_input | cut -c -2)

if [ $temp -ge 20 -a $temp -lt 40 ];then
    echo %{T3}3%{T-} %{F#e6db74}"$temp"°C%{F-}
    
elif [ $temp -ge 40 -a $temp -lt 50 ];then
    echo 🔥 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp -ge 50 ];then
    echo 🔥 %{F#f90e39}"$temp"°C%{F-}
    
fi
