#!/bin/bash

# Only Spotify
song_info=$(playerctl metadata -p spotify --format '󰎈 {{artist}} - {{title}} 󰎈')

echo "$song_info"
