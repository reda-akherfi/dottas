#!/usr/bin/env bash

set -e


FILENAME=$(zenity --file-selection  2> /dev/null)
zathura --fork "$FILENAME"

