#!/bin/bash

# Get the connected monitors using xrandr and store them in an array
connected_monitors=($(xrandr --query | grep " connected" | awk '{ print $1 }'))

# Initialize variables for internal and external monitors
intern=""
extern=""

# Loop through the array of connected monitors
for monitor in "${connected_monitors[@]}"; do
    if [[ "$monitor" == eDP* ]]; then
        intern=$monitor
    elif [[ "$monitor" == HDMI* ]]; then
        extern=$monitor
    fi
done

if [[ -n "$extern" ]]; then
    xrandr --output "$intern" --auto --output "$extern" --primary --right-of "$intern" --auto
else
    xrandr --output "$extern" --off --output "$intern" --auto
fi
