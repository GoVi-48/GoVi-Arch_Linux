#!/usr/bin/env bash

killall -q polybar

polybar govi >> /tmp/polygovi.log 2>&1 &

