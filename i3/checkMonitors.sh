#!/bin/bash

# the variable store 1 if connected and 0 if not
built_in=$(xrandr --listactivemonitors | grep " eDP-1" -c)
main_screen=$(xrandr --listactivemonitors | grep " DP-1" -c)
vertical_screen=$(xrandr --listactivemonitors | grep " HDMI-1" -c)

echo "The results are :"
echo $built_in
echo $main_screen
echo $vertical_screen
# the nomade setup : no external screen 
if [ $built_in == 1  -a $main_screen == 0 -a $vertical_screen == 0 ]; then
  xrandr --output eDP-1 --primary --auto
  echo "built_in screen"

# full setup : main_screen + vertical_screen
elif [ $main_screen == 1 -a $vertical_screen == 1 ]; then
  xrandr --output DP-1 --primary  --mode 3440x1440 ; xrandr --output HDMI-1 --mode 1920x1080 --rotate right --right-of DP-1 --rate 60 ; xrandr --output eDP-1 --off
  echo "full setup"

# half setup : only main_screen
elif [ $main_screen == 1 -a $vertical_screen == 0 ]; then
  xrandr --output DP-1 --primary --3440x1440
  echo "just main_screen"
else
  echo "y'a une couille"
fi
  


