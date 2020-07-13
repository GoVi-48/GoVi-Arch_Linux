#!/usr/bin/env bash

killall -q polybar

polybar -r govi >> /tmp/polygovi.log 2>&1 &

sleep 5

killall -q polybar

polybar -r govi >> /tmp/polygovi.log 2>&1 &

