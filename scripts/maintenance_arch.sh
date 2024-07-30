#!/usr/bin/env bash

# this script is used to automate maintenance tasks on the arch linux system
# it is inteneded to be run as an interactive script
#
# Author: Reda Akherfi
#

# check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

# check if the system is an arch linux system
if [ ! -f /etc/arch-release ]; then
    echo "This script is intended to be run on an Arch Linux system"
    exit
fi

# update the system
echo "Updating the system..."
/usr/bin/paru -Syu
echo "System updated"

# remove orphaned packages
echo "Removing orphaned packages..."
/usr/bin/paru -Rns $(/usr/bin/paru -qdtq)
echo "Orphaned packages removed"

# clearing the package cache
function clear_cache() {
    echo "Clearing the package cache..."
    /usr/bin/paru -Sc
    /usr/bin/paccache -dk2
    echo "Package cache cleared"
}

# ask the user if they want to clear the package cache
# if the user enters 'y' or 'Y', the package cache will be cleared
# if the user enters 'n' or 'N', the package cache will not be cleared
# if the user enters anything else, the user will be prompted again
# until they enter a valid input
# the user will be prompted to enter a valid input if they enter an invalid input
while true; do
    read -p "Do you want to clear the package cache? [y/n] " yn
    case $yn in
        [Yy]* ) clear_cache; break;;
        [Nn]* ) break;;
        * ) echo "Please answer 'y' or 'n'";;
    esac
done
