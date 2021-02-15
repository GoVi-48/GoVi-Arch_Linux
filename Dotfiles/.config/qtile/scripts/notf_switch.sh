#!/usr/bin/env bash

notf_ON=~/.config/qtile/scripts/notf_ON
notf_OFF=~/.config/qtile/scripts/notf_OFF

if [ -f $notf_ON ]; then
    rm -f $notf_ON
    touch $notf_OFF
    
elif [ -f $notf_OFF ]; then
    rm -f $notf_OFF
    touch $notf_ON

else
    touch $notf_ON

fi
