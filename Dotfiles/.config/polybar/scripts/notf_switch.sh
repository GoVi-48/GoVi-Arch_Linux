#!/usr/bin/env bash

NOTF_SOUND=~/.config/polybar/scripts/NOTF_SOUND

if [ -f $NOTF_SOUND ]; then
    rm -f $NOTF_SOUND
    
else
    touch $NOTF_SOUND
    
fi
