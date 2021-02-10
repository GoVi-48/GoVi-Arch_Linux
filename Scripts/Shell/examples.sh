#!/bin/bash


# Extract in between
awk -F "START|END" '{print $2}'
awk -F "START|END" 'NF>1 {print $2}' # Exclude blank lines

awk -v FS="(START|END)" '{print $2}'
awk -v FS="(START|END)" 'NF>1 {print $2}' # Exclude blank lines

sed -n "s/.*START\([^T]*\)END.*/\1/p"

# Extract start with
grep "^STRING"

awk '$1 ~ /^STRING/'

# Replace
sed 's/THIS/THAT/g'

# Check if output is a number
[[ $1 == ?(-)+([0-9]) ]] && echo "$1 is an integer"
