#!/usr/bin/env bash

# Global variables
root_passwd=Tzbg5340
user_name=reda
user_passwd=1966
swap_file=/swapfile
swap_file_size_gb=2024


users_setup(){
    # reda and root [how to reset the root passwd]
    # settin up the root account
    echo -e "#### settin up the root password!!!"
    read -p "please enter the root password:    " root_passwd
    echo -e root:"$root_passwd" | chpasswd
    echo -e "@@@@ just changed the passwd for the root account"
    # setting up the other accounts
    echo -e "#### setting up the reda account!!!"
    read -p "please enter the name of the  user account:  " user_name
    useradd -m $user_name  --shell /bin/bash
    echo -e "@@@@ just added the reda user!!!"
    read -p "please enter the passwd for the $user_name:   " user_passwd
    echo -e "$user_name":"$user_passwd" | chpasswd
    echo -e "@@@@ just changed the reda passwd"
    # setting up the groups
    echo -e "#### setting up the groups !!!"
    usermod -aG wheel,storage,power,audio,input reda
    echo -e "@@@@ just added reda to these groups: wheel,storage,power,audio,input"
    echo -e "#### adding reda to the sudoers file"
    sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
}

networking_setup() {
    # use network manager
    # create a bridge for kvm later use 
    # set a static ip address for the ethernet connection
    # later docker setup
    # DNS using the LAN and google's as backup
}

install_inner_software() {
    # set up pacman and paru
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
    # #     # Create the swap file
    # echo "Creating swap file at $swapfile"
    # sudo fallocate -l ${swapfile_size_mb}M $swapfile

    # # Set appropriate permissions
    # sudo chmod 600 $swapfile
    # learn a bit more
    echo -e "settin up the swapfile";
    read -p "please enter the size of the swapfile in GBs:  " swap_file_size_gb;
    # checking if the a swapfile already exists
    if [[ -f /swapfile ]];then
        echo -e "the $swap_file already exists so going out with a 1";
        return 1;
    fi
    # creating the swapfile
    mkswap -U clear --size "$swap_file_size_gb"G --file "$swapfile"
    echo -e "@@@@ just created the swapfile at  $swap_file  :: [[mkswap ...]]"
    swapon "$swap_file"
    echo -e "@@@@ just activated the swapfile :: [[swapon $swap_file]]"
    # adding add the swapfile to fstab
}
