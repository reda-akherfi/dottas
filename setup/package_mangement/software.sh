#!/usr/bin/env bash

# # base packages for the vm; change that for the actual machine
# sudo pacman -S  xorg-xwayland base-devel git gvim --needed --noconfirm 

# # installing yay 
# # git clone https://aur.archlinux.org/yay.git ~
# # cd ~/yay/
# # makepkg -si

# # installing more packages
# yay -S hyprland-git --save --answerclean All --answerdiff None --needed
# sudo pacman -S alacritty --needed --noconfirm  
# sudo pacman -S waybar --needed --noconfirm 
# # yay -S waybar-hyprland-git --needed --save --answerclean All --answerdiff None 

# # waybar needed a shit load of deps including all of pipewire; see the log
# sudo pacman -S xdg-desktop-portal-hyprland --needed --noconfirm 
# # font awesome is used by waybar
# sudo pacman -S otf-font-awesome --needed --noconfirm 
# sudo pacman -S tree ttf-roboto-mono-nerd --needed --noconfirm 
# sudo pacman -S terminus-font --needed --noconfirm 
# # tray applets
# sudo pacman -S network-manager-applet --needed --noconfirm 
# # sudo pacman -S volumeicon cbatticon --needed --noconfirm
# # sudo pacman -S hyprlock --needed --noconfirm
# # sudo pacman -S hypridle  --needed --noconfirm
# sudo pacman -S swaybg --needed --noconfirm
# sudo pacman -S polkit-kde-agent --needed --noconfirm
# sudo pacman -S wofi --needed --noconfirm
# sudo pacman -S qt5-wayland qt6-wayland --needed --noconfirm

# yay -S hyprshade --save --answerclean All --answerdiff None --needed

# yay -S wlogout  --save --answerclean All --answerdiff None --needed
# sudo pacman -S nwg-look --needed --noconfirm

# sudo pacman -S inotify-tools --needed --noconfirm

# # this makes stremio work
# sudo pacman -S xdg-desktop-portal-gnome --needed --noconfirm
# # cliphist
# sudo pacman -S cliphist --needed --noconfirm
# # wofi-pass : from the aur not super reliable of a choice, gotta keep a eye for a replacement
# yay -S wofi-pass --save --answerclean All --answerdiff None --needed
# # this is for rofi-pass -t 
# sudo pacman -S wtype --needed --noconfirm
# # seeing the name of keys; followed by some apps
# sudo pacman -S wev --needed --noconfirm
# # the best thing ever
# sudo pacman -S ydotool --needed --noconfirm
# sudo pacman -S swayidle  --needed --noconfirm
# yay -S gojq swaylock-effects --save --answerclean All --answerdiff None --needed
# sudo pacman -S bash-completion --needed --noconfirm
# sudo pacman -S mpv --needed --noconfirm
# sudo pacman -S ueberzug  --needed --noconfirm

# XXX pacman: where does pacman keep info about its pkgs and DBs :  /var/lib/pacman/{local,sync}/**
# it stores it cache it /var/cache/pacman/pkg/*.pkg.tar.zst [does not remove them]
# /etc/pacman.conf
# removing cache using paccache from pacman-contrib:  `sudo paccache -r -k2 -d` keep the last three of each pkg
# removing uneeded pkgs:  `sudo pacman -Rns $(pacman -Qdtq)`
# yay clones AUR repos and builds pkgs here:  ~/.cache/yay/
# its config:  ~/.config/yay/config.json
# yay -Sc   :: pacman -Sc
# pacman -Qeq > packages.txt
# pacman -S --needed --noconfirm - < pkglist.txt
#

install_yay() {
    sudo pacman -S --needed --noconfirm base-devel git 
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

# yay -S --needed --noconfirm - < /home/reda/dottas/setup/package_mangement/pkgreda

function install_paru() {
    sudo pacman -S base-devel --needed --noconfirm 
    git clone https://aur.archlinux.org/paru.git ~
    cd ~/paru
    makepkg -si
}
install_paru
paru -S --needed --noconfirm - < /home/reda/dottas/setup/package_mangement/pkgreda
