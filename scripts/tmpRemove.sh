#!/bin/bash

# temp directory
dir="$HOME/Downloads/temp/*"
# two weeks in seconds 
treshold=$((60*60*24*14))

#init some counters 
num_errors=0
num_success=0

for f in $dir; do
    # get the last access date of each file
    if [[ -f $f ]]; then
        last_access=$(stat -c %X "$f")
        curr_time=$(date +%s)
        time_lapsed=$((curr_time - last_access))

        if [[ $time_lapsed -gt $treshold ]]; then
            echo "$f"
            if rm "$f"; then
                ((num_success++))
            else
                ((num_errors++))
            fi
        fi
    fi
done

    dunstify -r 123 -u normal "[TMP REMOVE]"$'\n'"Numbers of errors: $num_errors"$'\n'"Numbers of success : $num_success"

