#!/usr/bin/env bash

load=$(echo $(free -h | grep "Mem" | awk '{print $3}' | cut -c -3 | sed "s/,/./g"))

if [ $echo "$load => 0" ]; then
    echo "  $load GB"
    
fi
