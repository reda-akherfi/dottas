#!/usr/bin/env bash

# this script with sync a local directory with a dropbox directory
#

function toremote() {
    local localdir="/home/reda/Documents/kernelcontrol"
    local remotedir="dropbox2017:/backups/kernelcontrol"
    echo "Syncing $localdir to $remotedir"
    /usr/bin/rclone sync $localdir $remotedir
    echo "finished syncing"
}

function tolocal() {
    local localdir="/home/reda/Documents/kernelcontrol"
    local remotedir="dropbox2017:/backups/kernelcontrol"
    echo "Syncing $remotedir to $localdir"
    /usr/bin/rclone sync $remotedir $localdir
    echo "finished syncing"
}

if [ "$1" == "to" ]; then
    toremote
elif [ "$1" == "from" ]; then
    tolocal
else
    echo "Usage: $0 to|from"
fi
