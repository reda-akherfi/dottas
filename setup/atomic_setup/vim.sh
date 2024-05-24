#!/usr/bin/env bash

# cleaning and creating the symlink
rm -rf ~/.vimrc
rm -rf ~/.config/vim
ln -sf ~/dottas/.config/vim/.vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

command -v apt 1>/dev/null 2> /dev/null
if [[ $? ]];then
    sudo apt install npm
    sudo apt remove nodejs
    sudo npm install -g n
    sudo n lts
fi

command -v dnf 1>/dev/null 2> /dev/null
if [[ $? ]];then
    sudo dnf install npm
fi

command -v pacman 1>/dev/null 2> /dev/null
if [[ $? ]];then
    sudo pacman install npm
fi


