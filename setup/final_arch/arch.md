# the least number of commands to install arch linux

# commands to be run in the live environment
## enable the time synchronization service
`timedatectl set-ntp true`
## set up the time zone
`timedatectl set-timezone Africa/Casablanca`
## sanity checks
`ls /sys/firmware/efi/efivars`
`ping -c 3 archlinux.org`
## partition the disk
use fdisk; create a 512M EFI partition, a 16G swap partition, and a root partition. Format the EFI partition as FAT32, the swap partition as swap, and the root partition as btrfs. do not forget to set the boot flag on the EFI partition.
## format the partitions
`mkfs.fat -F32 /dev/sda1`
`mkswap /dev/sda2`
`swapon /dev/sda2`
`mkfs.btrfs -L arch /dev/sda3`
## mount the partitions
