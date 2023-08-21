#!/bin/bash

input_file="$1"
output_dir="$2"

while read -r line ; do
    if [[ $line =~ ^\#\#\#\s(.*) ]]; then
        title="${BASH_REMATCH[1]}"
        output_file="${output_dir}/${title// /_}.md"
        touch "$output_file"
        echo "$output_file"
        echo "$line " > "$output_file"
        in_section=true
    elif [[ $line =~ ^\#\#\# ]]; then
        in_section=false
    elif [[ $in_section ]]; then
        echo "$line" >> "$output_file"
    fi
done < "$input_file"
