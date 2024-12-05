#!/bin/bash

front_app=(
    # label.font="$FONT:Black:12.0"
    icon.background.drawing=on
    display=active
    color=$WHITE
    background.color=$BG0
    label.padding_right=10
    label.padding_left=5
    # icon.padding_left=10
    label.y_offset=2
    script="$PLUGIN_DIR/front_app.sh"
)
sketchybar --add item front_app left \
    --set front_app "${front_app[@]}" \
    --subscribe front_app front_app_switched
