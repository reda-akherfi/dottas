#!/usr/bin/env bash


if wpctl status | grep -qE "\[active\]$";then
    true
else
    pidof hyprlock || hyprlock
fi
