#!/usr/bin/env bash

temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

if [ $temp -ge 20 -a $temp -lt 55 ];then
    echo %{T3}1%{T-} %{F#27ae60}"$temp"°C%{F-}
    
elif [ $temp -ge 55 -a $temp -lt 70 ];then
    echo 🔥 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp -ge 70 ];then
    echo 🔥 %{F#f90e39}"$temp"°C%{F-}
    
fi
