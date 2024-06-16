#!/usr/bin/env bash


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
    git clone https://aur.archlinux.org/yay.git $HOME/yay
    $HOME/yay/makepkg -si
}

# yay -S --needed --noconfirm - < /home/reda/dottas/setup/package_mangement/pkgreda

install_yay
yay -S --needed --noconfirm - < /home/reda/dottas/setup/package_mangement/pkgreda
