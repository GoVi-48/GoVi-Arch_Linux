#!/bin/bash

LOCATION=https://darksky.net/forecast/42.2207,-8.7325/ca12/en

TEMP=$(curl -s "$LOCATION" | awk -F 'summary swap">|˚&nbsp' 'NF>1 {print $2}')

echo "$TEMP°C "