#!/usr/bin/env bash


if pgrep -a swayidle > /dev/null ;then
    killall swayidle
    notify-send "swayidle" "killed the currently running instance"
else
    swayidle -w &
    notify-send "swayidle" "started a new instance"
fi

