#!/usr/bin/env bash

# Exit on any error
set -e

# Makes *.svg expand to nothing if no match
shopt -s nullglob

# Simplify all the svg files
for file in *.svg; do
    echo "Simplifying $file..."
    inkscape "$file" \
        --actions="select-all:all;path-simplify" \
        --export-filename="output/$file" \
        --export-overwrite
done
