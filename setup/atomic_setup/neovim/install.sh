#!/usr/bin/env bash


sudo pacman -S --needed neovim 

# if [[ -e "/home/reda/.config/nvim" ]];then
    rm -rvf /home/reda/.config/nvim
    ln -vsf /home/reda/dottas/setup/atomic_setup/neovim/nvim /home/reda/.config/nvim
# fi
