#!/usr/bin/env bash

#pgrep -x "wineserver" > /dev/null  && exit

LOAD="$(top -b -n1 | awk '/^%Cpu/ {print $2 + $4}' | awk -F '.' '{print $1}')"

if [ $LOAD -ge 0 -a $LOAD -lt 10 ];then
    echo " $LOAD% ▁ "

elif [ $LOAD -ge 10 -a $LOAD -lt 20 ];then
    echo "$LOAD% ▂ "

elif [ $LOAD -ge 20 -a $LOAD -lt 30 ];then
    echo "$LOAD% ▃ "

elif [ $LOAD -ge 30 -a $LOAD -lt 40 ];then
    echo "$LOAD% ▄ "

elif [ $LOAD -ge 40 -a $LOAD -lt 55 ];then
    echo "$LOAD% ▅ "

elif [ $LOAD -ge 55 -a $LOAD -lt 70 ];then
    echo "$LOAD% ▆ "

elif [ $LOAD -ge 70 -a $LOAD -lt 85 ];then
    echo "$LOAD% ▇ "

elif [ $LOAD -ge 85 -a $LOAD -lt 100 ];then
    echo "$LOAD% █ "

fi
