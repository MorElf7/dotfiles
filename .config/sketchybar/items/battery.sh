#!/bin/sh

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font.size=15
  padding_left=10
  update_freq=120
  updates=on
)
sketchybar --add item battery right \
           --set battery "${battery[@]}"\
           --subscribe battery power_source_change system_woke

