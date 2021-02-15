#!/usr/bin/env bash
 
notf_ON=~/.config/qtile/scripts/notf_ON
 
if [ -f $notf_ON ]; then
    echo -n "🔔"
    
else
    echo -n "🔕"
fi
