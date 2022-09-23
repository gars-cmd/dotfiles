#!/bin/bash

## get the actual layout
language=$(setxkbmap -query | awk '{print $2}' | awk 'NR==3')

# if the actual is on US we swtch for IL
if [[ $language == "us" ]]; then
    dunstify -I /home/gars/.config/dunst/keyboard_icon.png -r 2593 -u normal "IL"
    setxkbmap il
    echo "the language is now IL"
else
    dunstify -I /home/gars/.config/dunst/keyboard_icon.png -r 2593 -u normal "US"
    setxkbmap us
    echo "the language is now US"
fi

