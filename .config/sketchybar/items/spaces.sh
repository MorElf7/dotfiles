#!/bin/bash

sketchybar --add event aerospace_workspace_change
#echo $(aerospace list-workspaces --monitor 1 --visible no --empty no) >> ~/aaaa

# for m in $(aerospace list-monitors | awk '{print $1}'); do
#   for i in $(aerospace list-workspaces --monitor $m --visible); do
#     sid=$i
#     space=(
#       space="$sid"
#       icon="$sid"
#       icon.highlight_color=$RED
#       icon.padding_left=10
#       icon.padding_right=5
#       display=$m
#       label.color=$GREY
#       label.highlight_color=$WHITE
#       label.font="sketchybar-app-font:Regular:16.0"
#       label.y_offset=-1
#       background.color=$BACKGROUND_1
#       background.border_color=$BACKGROUND_2
#       script="$PLUGIN_DIR/space.sh"
#     )
#
#     sketchybar --add space space.$sid left \
#                --set space.$sid "${space[@]}" \
#                --subscribe space.$sid aerospace_workspace_change
#
#     apps=$(aerospace list-windows --workspace $sid | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
#
#     icon_strip=""
#
#     sketchybar --set space.$sid label="$icon_strip"
#   done
#
#   for i in $(aerospace list-workspaces --monitor $m --empty); do
#     sketchybar --set space.$i display=0
#   done
#
# done
#
#
# space_creator=(
#   # icon=􀆊
#   # icon.font="$FONT:Heavy:16.0"
#   padding_left=10
#   padding_right=8
#   label.drawing=off
#   display=active
#   #click_script='yabai -m space --create'
#   script="$PLUGIN_DIR/space_windows.sh"
#   icon.color=$WHITE
# )
#
# sketchybar --add item space_creator left               \
#            --set space_creator "${space_creator[@]}"   \
#            --subscribe space_creator aerospace_workspace_change

space=(
    script="$PLUGIN_DIR/aerospace.sh"
    label.font.size=15
    color=$WHITE
    background.color=$BG2
    label.padding_right=10
    label.y_offset=2
)

sketchybar --add item aerospace left \
    --set aerospace "${space[@]}" \
    --subscribe aerospace aerospace_workspace_change
