#!/usr/bin/env bash

if pgrep -a foot;then
    true
else
    /usr/bin/foot --server
fi

/usr/bin/tmux new-session -s kirk
/usr/bin/tmux new-window -t kirk -n launch /usr/bin/bash

/usr/bin/footclient --title 'tmuxi' /usr/bin/tmux attach -t kirk

