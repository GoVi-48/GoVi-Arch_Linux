#!/usr/bin/env bash

pgrep -x "wineserver" > /dev/null  && exit

temp=$(sensors | awk '$1 ~ /^Package/ {print substr($0,17,2)}')

if [ $temp -ge 20 -a $temp -lt 55 ]; then
    echo "$temp°C "
    
elif [ $temp -ge 55 -a $temp -lt 70 ]; then
    echo "$temp°C "

elif [ $temp -ge 70 ]; then
    echo "$temp°C "

fi
