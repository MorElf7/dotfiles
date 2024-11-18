#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"
sketchybar --set $NAME label="[ $FOCUSED_WORKSPACE ]" 
