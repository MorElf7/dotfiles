#!/bin/bash

PLAYING=$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')
if [ $PLAYING == "playing" ]; then
    TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
    ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
    ALBUM=$(osascript -e 'tell application "Spotify" to get album of current track')
    if [ "$ARTIST" == "" ]; then
        sketchybar -m --set $NAME label="$TRACK - $ALBUM"
    else
        sketchybar -m --set $NAME label="$TRACK - $ARTIST"
    fi
else
    sketchybar -m --set $NAME label=""
fi
