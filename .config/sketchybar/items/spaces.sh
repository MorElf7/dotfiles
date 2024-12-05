#!/bin/bash

sketchybar --add event aerospace_workspace_change
#echo $(aerospace list-workspaces --monitor 1 --visible no --empty no) >> ~/aaaa

for m in $(aerospace list-monitors | awk '{print $1}'); do
    for sid in $(aerospace list-workspaces --monitor $m); do
        space=(
            label.font.size=14
            background.color=$BG0
            label="$sid"
            label.padding_right=10
            label.y_offset=2
            display=$m
            script="$PLUGIN_DIR/aerospace.sh $sid"
            # click_script="aerospace workspace $sid"
        )

        sketchybar --add item space.$sid left \
            --set space.$sid "${space[@]}" \
            --subscribe space.$sid aerospace aerospace_workspace_change
    done
done

# space=(
#     script="$PLUGIN_DIR/aerospace.sh"
#     label.font.size=14
#     color=$WHITE
#     background.color=$BG2
#     label.padding_right=10
#     label.y_offset=2
# )
# sketchybar --add item aerospace left \
#     --set aerospace "${space[@]}" \
#     --subscribe aerospace aerospace_workspace_change
