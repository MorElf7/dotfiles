#!/bin/bash

wifi=(
    script="$PLUGIN_DIR/wifi.sh"
    color=$WHITE
    background.color=$BG2
    icon.padding_right=10
    icon.padding_left=10
    icon.y_offset=0
    updates=on
    label.drawing=off
)
sketchybar --add item wifi right \
    --set wifi "${wifi[@]}" \
    --subscribe wifi_change wifi system_woke
