#!/usr/bin/env sh

# From Gruvbox Dark
FG1=0xffcad3f5 # or whatever you use for active icons
FG2=0xff665c54 # or whatever you use for dim icons

# From SF Symbols
NET_WIFI=􀙇         # Wi-Fi connected
NET_HOTSPOT=􀉤      # iPhone Wi-Fi hotspot connected
NET_USB=􀟜          # iPhone USB hotspot connected
NET_THUNDERBOLT=􀒗  # Thunderbolt bridge connected
NET_DISCONNECTED=􀙥 # Network disconnected, but Wi-Fi turned on
NET_OFF=􀙈          # Network disconnected, Wi-Fi turned off

# When switching between devices, it's possible to get hit with multiple
# concurrent events, some of which may occur before `scutil` picks up the
# changes, resulting in race conditions.
sleep 1

services=$(networksetup -listnetworkserviceorder)
device=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p")

test -n "$device" && service=$(echo "$services" \
  | sed -n "s/.*Hardware Port: \([^,]*\), Device: $device.*/\1/p")


color=$FG1
case $service in
  "iPhone USB")         icon=$NET_USB;;
  "Thunderbolt Bridge") icon=$NET_THUNDERBOLT;;

  Wi-Fi)
    ssid=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')
    case $ssid in
      *iPhone*) icon=$NET_HOTSPOT;;
      "")       icon=$NET_DISCONNECTED; color=$FG2;;
      *)        icon=$NET_WIFI;;
    esac;;

  *)
    wifi_device=$(echo "$services" \
      | sed -n "s/.*Hardware Port: Wi-Fi, Device: \([^\)]*\).*/\1/p")
    test -n "$wifi_device" && status=$( \
      networksetup -getairportpower "$wifi_device" | awk '{print $NF}')
    icon=$(test "$status" = On && echo "$NET_DISCONNECTED" || echo "$NET_OFF")
    color=$FG2;;
esac

sketchybar --animate sin 5 --set "$NAME" icon="$icon" icon.color="$color"
