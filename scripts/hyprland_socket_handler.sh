#!/bin/sh

handle() {
  case $1 in
    monitoradded*) true ;;
    focusedmon*) true ;;
    workspace*) pkill -RTMIN+8 waybar;;
    activespecial*) pkill -RTMIN+8 waybar;;
    *) pkill -RTMIN+8 waybar;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
