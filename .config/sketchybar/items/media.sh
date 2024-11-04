#!/bin/sh

media=(
  icon=􀑪
  icon.padding_right=2
  icon.font.size=15
  label.align=right
  padding_left=0
  script="$PLUGIN_DIR/media.sh"
)

sketchybar --add item media center \
  --set media "${media[@]}" \
  --subscribe media media_change system_woke
