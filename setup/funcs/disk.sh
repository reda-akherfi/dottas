#!/usr/bin/env bash

target_disk=NOTHING
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
            echo -e "### one more time; you have selected $target_disk as your target.Do you confirm?"
            read -p "### yes or no?" confirm 
            if [[ $confirm == "yes" ]];then
                echo "### out with $target_disk"
                break;
            fi
        fi
    done
}

destroy_target_disk() {
    # the dd command using /dev/zero or for security /dev/urandom
    echo hi
}

set_up_lvm() {
    # no partitions; pv, vg, lvs, 
    echo hi
}

set_up_filesystem() {
    # use ext4 and fat32 
    echo hi
}


mount_partitions() {
    # / /boot  and /home 
    echo hi
}

update_fstab() {
    # 
    echo hi
}

pinpoint_target_disk
