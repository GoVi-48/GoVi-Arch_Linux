#!/usr/bin/env bash

free -h |
awk '/^Mem:/ {print $3}' |
sed "s/Mi/ MB/g ; s/Gi/ GB/g ; s/,/./g"

