#!/usr/bin/env bash


if pgrep -a hypridle > /dev/null ;then
    killall hypridle
    notify-send "hypridle" "killed the currently running instance"
else
    hypridle  &
    notify-send "hypridle" "started a new instance"
fi

