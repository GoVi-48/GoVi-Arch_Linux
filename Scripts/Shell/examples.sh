#!/bin/bash


# Extract in between
awk -F "START|END" '{print $2}'
awk -F "START|END" 'NF>1 {print $2}' # Exclude blank lines

awk -v FS="(START|END)" '{print $2}'
awk -v FS="(START|END)" 'NF>1 {print $2}' # Exclude blank lines

sed -n "s/.*START\([^T]*\)END.*/\1/p"

# Extract starts with
grep "^STRING"

awk '$1 ~ /^STRING/'

# Extract starts with and Substract
awk '$1 ~ /^STRING/ {print substr($0,16,2)}' # Substract 2 characters of string 16
awk '$1 ~ /^STRING/ {print substr($0,16,2); exit}' # Exit in the first match

# Replace
sed 's/THIS/THAT/g'

# Rename multiple files
for i in /DIR/*THIS* ; do mv -v "$i" "${i/\THIS/THAT}" ; done

# Check if output is a number
[[ $1 == ?(-)+([0-9]) ]] && echo "$1 is an integer"
