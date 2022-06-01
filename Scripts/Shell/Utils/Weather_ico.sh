#!/bin/bash

while ! ping -c2 google.com > /dev/null 2>&1; do sleep 10; done

LOCATION=https://darksky.net/forecast/42.2207,-8.7325/ca12/en

STATUS=$(curl -s "$LOCATION" | awk '/"summary swap">/')

[[ "$STATUS" =~ "Clear" ]] && echo "☀"

[[ "$STATUS" =~ "Partly Cloudy" ]] && echo "🌤"

[[ "$STATUS" =~ "Mostly Cloudy" ]] && echo "🌥"

[[ "$STATUS" =~ "Overcast" ]] && echo "☁"

[[ "$STATUS" =~ "Rain Sun" ]] && echo "🌦"

[[ "$STATUS" =~ "Rain" ]] && echo "🌧"

[[ "$STATUS" =~ "Storm" ]] && echo "🌩"

[[ "$STATUS" =~ "Snow" ]] && echo "🌨"


