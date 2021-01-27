#!/bin/bash

DIR=$(dirname "$(realpath "$0")")

pass > "$DIR/passtore.log" &

cat "$DIR/passtore.log"

exit