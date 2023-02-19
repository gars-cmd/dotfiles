#!/bin/bash


dir="$HOME/Downloads/temp/"
files=$(find "$dir" -type f)
for file in $files; do
        echo "$file"
done
