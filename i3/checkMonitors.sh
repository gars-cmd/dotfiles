#!/bin/bash

# the variable store 1 if connected and 0 if not
built_in=$(xrandr --listactivemonitors | grep " eDP-1" -c)
main_screen=$(xrandr --listactivemonitors | grep " DP-1" -c)
vertical_screen=$(xrandr --listactivemonitors | grep " HDMI-1" -c)

# the nomade setup : no external screen 
if [[ $built_in==1  && $main_screen==0 && $vertical_screen==0 ]]; then
  xrandr --output eDP-1 --primary --auto

# full setup : main_screen + vertical_screen
elif [[ $main_screen==1 && $vertical_screen==1 ]]; then
  xrandr --output DP-1 --primary  --3440x1440 ; xrandr --output HDMI-1 --mode 1920x1080 --rotate right --right-of DP-1 --rate 60 ; xrandr --output eDP-1 --off

# half setup : only main_screen
elif [[ $main_screen==1 && $vertical_screen==0 ]]; then
  xrandr --output DP-1 --primary --3440x1440
else
  echo "y'a une couille"
fi
  


