#!/usr/bin/env bash
# if=/home/reda/torrents/complete/proxmox-ve_8.2-1.iso    \
#
sudo dd bs=4M \
if=/home/reda/torrents/complete/archlinux-2024.05.01-x86_64.iso    \
of=/dev/disk/by-id/usb-Kingston_DataTraveler_3.0_D0C5D333879BF2B057DE0041-0:0 \
conv=fsync \
oflag=direct  \
status=progress
