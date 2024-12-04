#!/bin/bash

calendar=(
    icon=􀉉
    icon.font.size=15
    label.align=right
    icon.padding_left=10
    label.padding_right=10
    update_freq=30
    color=$WHITE
    background.color=$BG2
    script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right \
    --set calendar "${calendar[@]}" \
    --subscribe calendar system_woke
