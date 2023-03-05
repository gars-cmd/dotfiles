#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
  pactl get-sink-mute 0 | grep yes
}

function send_notification_u {
    volume=$(get_volume)
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "▉" $((volume / 5)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -i /home/gars/.config/dunst/volume_up_icon_reversed.png  -r 2593 -u normal "     $bar"
}


function send_notification_d {
    volume=$(get_volume)
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "▉" $((volume / 5 )) | sed 's/[0-9]//g')

    # Send the notification
    dunstify -i /home/gars/.config/dunst/volume_down_icon_reversed.png  -r 2593 -u normal "     $bar"
}

case $1 in
    up)
	# Set the volume on (if it was muted)
    pactl set-sink-mute 0 no 
	# Up the volume (+ 5%)
    pactl set-sink-volume 0 +5% 
	send_notification_u
	;;
    down)
    pactl set-sink-volume 0 -5%
	send_notification_d
	;;
    mute)
      pactl set-sink-mute 0 toggle
      dunstify -i /home/gars/.config/dunst/mute_icon_reversed.png  -r 2593 -u normal "     Mute"
	;;
esac
