#!/usr/bin/env bash

spotify=(
    icon=􀑪
    script="$PLUGIN_DIR/spotify.sh"
    label.shadow.drawing=off
    label.color=$BG0
    icon.color=$BG0
    background.color=$BLUE
    label.padding_right=10
    icon.padding_left=10
    updates=on
)

sketchybar --add event spotify_change "com.spotify.client.PlaybackStateChanged" \
    --add item spotify center \
    --set spotify "${spotify[@]}" \
    --subscribe spotify spotify_change
