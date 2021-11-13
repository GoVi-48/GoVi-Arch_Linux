#!/usr/bin/env bash

#pgrep -x "wineserver" > /dev/null  && exit

free -h |
awk '/^Mem:/ {print $3}' |
sed "s/Mi/ MB/g ; s/Gi/ GB/g ; s/,/./g"

