#!/usr/bin/env bash


users_setup() {
    # reda and root [how to reset the root passwd]
}

networking_setup() {
    # use network manager
    # create a bridge for kvm later use 
    # set a static ip address for the ethernet connection
    # later docker setup
    # DNS using the LAN and google's as backup
}

install_inner_software() {
    # set up pacman and yay
    # install the package.list
}

setup_inner_software() {
    # symlinks and misc
    # special pieces of software from ./setup_inner_softties.sh
    setup_inner_software_dropbox
    setup_inner_software_kvm
    setup_inner_software_docker
    setup_inner_software_nfs_client
    setup_inner_software_smb_client
}

bootloader_setup() {
    # setup and install grub for 2 kernels and the microcode
    # tweak any kernel params or customizations
    # setup a nice splash screen for vanity's sake
}

systemd_services_n_timers_system_user() {
    # console font ; pacman hook for LVM snapshots
}

swapfile_setup() {
    # I am thinking 8G?
    # learn a bit more
}
