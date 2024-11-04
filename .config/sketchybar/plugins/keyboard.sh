#!/bin/bash

# this is jank and ugly, I know
# LAYOUT="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -c 33- | rev | cut -c 2- | rev)"
INPUT_SOURCE_KIND="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources| grep -o 'InputSourceKind = "[^"]*"' | sed -n '2p' | cut -d '"' -f 2)"

# specify short layouts individually.
case "$INPUT_SOURCE_KIND" in
    "Input Mode") SHORT_LAYOUT="VI";;
    "Keyboard Layout") SHORT_LAYOUT="US";;
    *) SHORT_LAYOUT="N/A";;
esac

sketchybar --set keyboard label="$SHORT_LAYOUT"
