#!/usr/bin/env bash

temp=$(sensors | awk '$1 ~ /^temp1/ {print substr($0,16,2); exit}')

if [ $temp -ge 20 -a $temp -lt 40 ];then
    echo "${temp}°C "
    
elif [ $temp -ge 40 -a $temp -lt 50 ];then
    echo "🔥 ${temp}°C "

elif [ $temp -ge 50 ];then
    echo "🔥 ${temp}°C "
   
fi
