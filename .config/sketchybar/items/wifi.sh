#!/bin/sh

wifi=(
  script="$PLUGIN_DIR/wifi.sh"
  updates=on
  label.drawing=off
)
sketchybar --add item wifi right \
           --set wifi "${wifi[@]}"\
           --subscribe wifi_change wifi

