#!/bin/bash

# Set the directory to search
dir="$HOME/Downloads/temp/*"

# Find all the files in the directory that contain space 


#init counters
num_errors=0
num_success=0

for f in $dir; do
    # Replace the spaces in the file name with underscores
    if [[ "$f" = *" "* ]]; then
        if mv "$f" "${f// /_}"; then
            ((num_success++))
        else
            ((num_errors++))
        fi
    fi
done


dunstify -r 123 -u normal "[REPLACE SPACE -> UNDERSCORE]"$'\n'"Numbers of errors: $num_errors"$'\n'"Numbers of success : $num_success"
