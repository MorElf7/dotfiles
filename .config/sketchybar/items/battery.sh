#!/bin/bash

battery=(
    script="$PLUGIN_DIR/battery.sh"
    icon.font.size=15
    icon.padding_left=10
    update_freq=120
    color=$WHITE
    background.color=$BG2
    label.padding_right=10
    label.y_offset=0
    updates=on
)
sketchybar --add item battery right \
    --set battery "${battery[@]}" \
    --subscribe battery power_source_change system_woke
