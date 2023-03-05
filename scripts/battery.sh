#!/bin/bash

battery_level=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\  empty|percentage" | awk '{print $2}'| tail -1 | sed 's/.$//')

battery_state=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\  empty|percentage" | awk '{print $2}'| head -1)

# if charging
if [ "$battery_state" == "fully-charged" -o "$battery_state" == "charging" ]; then
  echo "charging"
  if  ((battery_level >=90))  ; then
    echo "battery charging and >= 90%"
    dunstify -I /home/gars/.config/dunst/battery_charging_full_reversed.png -r 2593 -u normal "$battery_level %"
    
  elif  ((battery_level <90 && battery_level >= 70)) ; then
    echo "battery charging between 90 and 70"
    dunstify -I /home/gars/.config/dunst/battery_charging_75_reversed.png -r 2593 -u normal "$battery_level %"

  elif  ((battery_level <70 && battery_level >= 50)) ; then
    echo "battery charging between 70 and 50"
    dunstify -I /home/gars/.config/dunst/battery_charging_half_reversed.png -r 2593 -u normal "$battery_level %"

  elif ((battery_level <50 && battery_level >= 20)) ; then
    echo "battery charging between 50 and 20"
    dunstify -I /home/gars/.config/dunst/battery_charging_25_reversed.png -r 2593 -u normal "$battery_level %"

  else
    echo "battery charging bellow 20%"
    dunstify -I /home/gars/.config/dunst/battery_charging_empty_reversed.png -r 2593 -u normal "$battery_level %"
  fi
else
  echo "not charging"
  if  ((battery_level >=90))  ; then
    echo "battery >= 90%"
    dunstify -I /home/gars/.config/dunst/battery_full_reversed.png -r 2593 -u normal "$battery_level %"
    
  elif  ((battery_level <90 && battery_level >= 70)) ; then
    echo "battery between 90 and 70"
    dunstify -I /home/gars/.config/dunst/battery_75_reversed.png -r 2593 -u normal "$battery_level %"

  elif  ((battery_level <70 && battery_level >= 50)) ; then
    echo "battery between 70 and 50"
    dunstify -I /home/gars/.config/dunst/battery_half_reversed.png -r 2593 -u normal "$battery_level %"

  elif  ((battery_level <50 && battery_level >= 20)) ; then
    echo "battery between 50 and 20"
    dunstify -I /home/gars/.config/dunst/battery_25_reversed.png -r 2593 -u normal "$battery_level%"

  else
    echo "battery bellow 20%"
    dunstify -I /home/gars/.config/dunst/alert_battery_icon_reversed.png -r 2593 -u normal "$battery_level %"
  fi
fi


