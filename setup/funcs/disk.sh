#!/usr/bin/env bash

## Global variables
target_disk=NOTHING
want_to_nuke_drive=HELLNO

source ~/dottas/setup/bash_colors_source_me_everywhere.sh

# set -ex

pinpoint_target_disk() {
    # pinpoint the disk to destroy
    echo -e "### Time to choose the disk:";
    local first_column_disks=$(lsblk -l | grep disk | awk '{print $1}');
    local not_yet=true;
    while [ $not_yet ];do
        for disk in $first_column_disks;do
            echo -e "------------------------------------------\n"
            lsblk -f /dev/$disk
            echo -e "### is ${RED}$disk ${WHITE}is your desired disk";
            echo -e "### yes?no ";
            read answer;
            if [[ $answer == "yes" ]];then
                target_disk=$disk;
                break;
            fi
        done
        if [[ !$not_yet ]];then
            echo -e "### one more time; you have selected $target_disk as your target.Do you confirm?";
            read -p "### yes or no?" confirm; 
            if [[ $confirm == "yes" ]];then
                echo "### out with $target_disk";
                break;
            fi
        fi
    done
}

destroy_target_disk() {
    # the dd command using /dev/zero or for security /dev/urandom
    echo -e "### Do you really want to nuke /dev/${target_disk} yes or no?   " 
    read want_to_nuke_drive
    if [[ $want_to_nuke_drive == "yes" ]];then
        # remove all LVs
        for lv in $(lvs --noheadings -o lv_path);do
            lvchange --activate n ${lv}
            lvremove -f  ${lv}
        done
        # remove all VGs
        for vg in $(vgs --noheadings -o vg_name);do
            vgremove -f  ${vg}
        done
        # remove all PVs
        for pv in $(pvs --noheadings -o pv_name);do
            pvremove -f  ${pv}
        done
        wipefs --all --force /dev/"${target_disk}"
        echo -e "#### you have nuked /dev/$want_to_nuke_drive"
    else
        echo -e "#### you have decided not to zero over /dev/$target_disk"
    fi
}

set_up_lvm() {
    # no partitions; pv, vg, lvs, 
    parted --fix --script /dev/"${target_disk}" mklabel "gpt"
    parted --fix --script /dev/"${target_disk}" mkpart "EFIREDA" "fat32" 1MiB 500MiB
    parted --fix --script /dev/"${target_disk}" set 1 esp on
    parted --fix --script /dev/"${target_disk}" mkpart "LVMPVREDA" 501MiB 100%
    pvcreate /dev/"${target_disk}"2
    vgcreate vg0 /dev/"${target_disk}"2
    lvcreate --yes --wipesignatures y -L 5G -n lv_root vg0
    lvcreate --yes --wipesignatures y -L 3G -n lv_home vg0
    # lvcreate --yes --wipesignatures y -L 1G -n lv_swap vg0
}

set_up_filesystem() {
    # use ext4 and fat32 
    echo -e "making the file system\n"
    mkfs.fat -F 32 /dev/"${target_disk}"1
    mkfs.ext4 /dev/vg0/lv_root
    mkfs.ext4 /dev/vg0/lv_home
    # mkswap /dev/vg0/lv_swap
}


mount_partitions() {
    # / /boot  and /home 
    mount --mkdir  /dev/${target_disk}1 /mnt/boot
    mount /dev/vg0/lv_root  /mnt
    mount --mkdir /dev/vg0/lv_home /mnt/home
}


# here the show begins
umount -R /mnt{,/boot,/home}
pinpoint_target_disk;
while [[ $target_disk == "NOTHING" ]];do
    echo -e "#### you have not selected a disk yet?";
    pinpoint_target_disk;
done
destroy_target_disk;
set_up_lvm
set_up_filesystem
mount_partitions
