#!/usr/bin/env bash
set -e 

spec_wspace_name=$(hyprctl monitors -j | jq -r '.[0]."specialWorkspace"."name"')
# echo $spec_wspace_name

if [[ "$spec_wspace_name" == 'special:special' ]];then
    num_windows_special=$(hyprctl workspaces -j | jq '.[] | select(.name == "special:special").windows')
    # echo -e " fuck $num_windows_special"
else 
    current_workpace=$(hyprctl monitors -j | jq -r '.[] | select(.focused).activeWorkspace.id')
    num_windows_special=$(hyprctl workspaces -j | jq ".[] | select(.id == $current_workpace).windows")
fi

# current_workpace=$(hyprctl monitors -j | jq -r '.[] | select(.focused).activeWorkspace.id')
# current_workpace=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).id')
echo "{\"text\": \"$num_windows_special\"}"
# echo $num_windows_special
