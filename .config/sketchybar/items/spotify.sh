#!/usr/bin/env bash

spotify=(
  icon=􀑪
  script="$PLUGIN_DIR/spotify.sh"
)

sketchybar --add event spotify_change "com.spotify.client.PlaybackStateChanged" \
		--add item spotify center \
        --set spotify "${spotify[@]}" \
		--subscribe spotify spotify_change 
