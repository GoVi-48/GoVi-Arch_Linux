#!/usr/bin/env bash

load=$(top -b -n1 | awk '/^%Cpu/ {print $2 + $4}' | awk -F '.' '{print $1}')


if [ $load -ge 0 -a $load -lt 10 ];then
    echo " $load% ▁ "
    
elif [ $load -ge 10 -a $load -lt 20 ];then
    echo "$load% ▂ "
    
elif [ $load -ge 20 -a $load -lt 30 ];then
    echo "$load% ▃ "
    
elif [ $load -ge 30 -a $load -lt 40 ];then
    echo "$load% ▄ "
    
elif [ $load -ge 40 -a $load -lt 55 ];then
    echo "$load% ▅ "
    
elif [ $load -ge 55 -a $load -lt 70 ];then
    echo "$load% ▆ "
    
elif [ $load -ge 70 -a $load -lt 85 ];then
    echo "$load% ▇ "
    
elif [ $load -ge 85 -a $load -lt 100 ];then
    echo "$load% █ "
    
fi
