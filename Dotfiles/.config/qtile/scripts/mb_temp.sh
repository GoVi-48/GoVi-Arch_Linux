#!/usr/bin/env bash

temp=$(cat "/sys/devices/platform/it87.2608/hwmon/hwmon2/temp1_input" | cut -c -2)

if [ $temp -ge 20 -a $temp -lt 40 ];then
    echo "${temp}°C "
    
elif [ $temp -ge 40 -a $temp -lt 50 ];then
    echo "🔥 ${temp}°C "

elif [ $temp -ge 50 ];then
    echo "🔥 ${temp}°C "
   
fi
