#!/usr/bin/env bash

# this script is used to define colors for the terminal
# and to use them in other scripts
# to use this script in another script, use the following command:
# source /path/to/colors.sh
# then you can use the colors defined in this script
# to use a color, use the following syntax:
# echo -e "${RED}This is red text${NC}"
# the NC variable is used to reset the color back to the default color
# you can also use the colors in the echo command directly like this:
# echo -e "\e[31mThis is red text\e[0m"
# the \e[0m is used to reset the color back to the default color
#

# define colors
#
NC='\e[0m' # No Color
BLACK='\e[0;30m'
DARK_GRAY='\e[1;30m'
BLUE='\e[0;34m'
LIGHT_BLUE='\e[1;34m'
GREEN='\e[0;32m'
LIGHT_GREEN='\e[1;32m'
CYAN='\e[0;36m'
LIGHT_CYAN='\e[1;36m'
RED='\e[0;31m'
LIGHT_RED='\e[1;31m'
PURPLE='\e[0;35m'
LIGHT_PURPLE='\e[1;35m'
YELLOW='\e[0;33m'


function warning() {
    echo -e "${YELLOW}Warning: $1${NC}"
}

function error() {
    echo -e "${RED}Error: $1${NC}"
}

function info() {
    echo -e "${CYAN}Info: $1${NC}"
}

info "This is an info  message"
 
