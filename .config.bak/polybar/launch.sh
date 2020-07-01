#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

polybar govi >>/tmp/polygovi.log 2>&1 &
#polybar govi2 >>/tmp/polygovi2.log 2>&1 &

echo "Bars launched..."
