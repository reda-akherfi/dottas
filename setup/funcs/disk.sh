#!/usr/bin/env bash

## Global variables
target_disk=NOTHING
want_to_nuke_drive=HELLNO


pinpoint_target_disk() {
    # pinpoint the disk to destroy
    echo -e "### Time to choose the disk:";
    local first_column_disks=$(lsblk -l | grep disk | awk '{print $1}');
    local not_yet=true;
    while [ $not_yet ];do
        for disk in $first_column_disks;do
            echo -e "### is $disk is your desired disk";
            echo -e "### yes?no";
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
        dd if=/dev/zero of=/dev/${target_disk} bs=512 count=1;
        echo -e "#### you have nuked /dev/$want_to_nuke_drive"
    else
        echo -e "#### you have decided not to zero over /dev/$target_disk"
    fi
}

set_up_lvm() {
    # no partitions; pv, vg, lvs, 
    parted --fix --script /dev/${target_disk} mklabel "gpt"
    parted --fix --script /dev/${target_disk} mkpart "EFIREDA" "fat32" 1MiB 300MiB
    parted --fix --script /dev/${target_disk} set 1 esp on
    parted --fix --script /dev/${target_disk} mkpart "LVMPVREDA" 301MiB 100%
    pvcreate /dev/${target_disk}2
}

set_up_filesystem() {
    # use ext4 and fat32 
    true
}


mount_partitions() {
    # / /boot  and /home 
    true
}

update_fstab() {
    # 
    true
}

# here the show begins
pinpoint_target_disk;
while [[ $target_disk == "NOTHING" ]];do
    echo -e "#### you have not selected a disk yet?";
    pinpoint_target_disk;
done
destroy_target_disk;
set_up_lvm
set_up_filesystem
mount_partitions
update_fstab
