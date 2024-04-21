#!/usr/bin/env bash


# find the root of the project where the Makefile is located
proj_dir="$HOME/projects/pomodoro_cpp"
target_file="Makefile"
find_make() {
    while [[ "$proj_dir" != "/" ]]; do
        if [ -f "$proj_dir/$target_file" ];then
            echo -n "$proj_dir"
            return 0
        fi
        # go up one dir
        proj_dir="${proj_dir%/*}"
    done
    echo ""
    return 1
}
clear
proj_dir=$(find_make)
echo "proj dir after the func $proj_dir"
# make clean all
cd "$proj_dir" || exit 1
make clean && echo -e "\n\n\n" && make && echo -e "\n\n\n" && $proj_dir/bin/pomo

