#!/bin/bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh
source "$CONFIG_DIR/colors.sh"

FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"
# sketchybar --set $NAME label="$FOCUSED_WORKSPACE"
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.color=$MAGENTA label.color=$BG0 label.shadow.drawing=off
else
    sketchybar --set $NAME background.color=$BG0 label.color=$WHITE
fi
