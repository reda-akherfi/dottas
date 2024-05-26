#!/usr/bin/env bash

# Global variables
source ./config_symlinks_configs.sh


symlinking_software_configs() {
    # need to save an associated array of symlinks and original dirs/files
        for dotfile in "${!symlinks[@]}"; do
            target="${symlinks[$dotfile]}"
            if [ -e "$dotfile" ]; then
                echo "Backing up existing $dotfile to $dotfile.bak"
                mv "$dotfile" "$dotfile.bak"
            fi
            ln -s "$target" "$dotfile"
            echo "Created symlink for $dotfile -> $target"
        done
}

install_inner_software_dropbox() {
    true
}

# install_inner_software_kvm

/home/reda/dottas/setup/package_mangement/software.sh
symlinking_software_configs
