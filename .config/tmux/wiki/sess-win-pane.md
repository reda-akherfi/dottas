1. sessions :
    * rename a session :  $ tmux rename-session -t [old] [new]  || :rename-session [new]
    * create a sess    :  $ tmux new -s [name]
    * attach to sess   : $ tmux attach-session -d -t [name]
    * killing a session or the server :  $ tmux kill-session -t [name] || add the -a for the inverse || kill-server
2. windows :
    * create : pre c
    * switch between : pre n and p
    * ls windows : pre w
    * close win : pre &
    * swap 2 wins : pre :swap-window -s [source-index] -t [target-index]

