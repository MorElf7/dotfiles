#!/bin/bash

keyboard=(
    icon.drawing=off
    # label.font="$FONT:Semibold:14.0"
    script="$PLUGIN_DIR/keyboard.sh"
    color=$WHITE
    background.color=$BG2
    label.padding_right=10
    label.padding_left=10
    label.y_offset=0
)

sketchybar --add item keyboard right \
    --set keyboard "${keyboard[@]}" \
    --add event keyboard_change "AppleSelectedInputSourcesChangedNotification" \
    --subscribe keyboard keyboard_change
