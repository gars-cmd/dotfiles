#!/bin/bash


function send_notification_p {
  dunstify -i /home/gars/.config/dunst/play_pause_icon_reversed.png -r 2593 -u normal "PAUSE/PLAY"
}

function send_notification_b {
  dunstify -i /home/gars/.config/dunst/backward_icon_reversed.png -r 2593 -u normal "BACKWARD"
}

function send_notification_f {
  dunstify -i /home/gars/.config/dunst/forward_icon_reversed.png -r 2593 -u normal "FORWARD"
}

case "$1" in
  pplay) 
    playerctl play-pause
    send_notification_p
  ;;
  forw) 
    playerctl next
    send_notification_f
  ;;
  back) 
    playerctl previous
    send_notification_b
  ;;
esac
