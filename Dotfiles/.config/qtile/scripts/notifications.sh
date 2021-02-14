#!/usr/bin/env bash
 
NOTF_SOUND=~/.config/qtile/scripts/NOTF_SOUND
 
if [ -f $NOTF_SOUND ]; then
    echo -n "🔔"
    
else
    echo -n "🔕"
fi
