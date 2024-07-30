#!/usr/bin/env bash

# import the colors
. colors.sh

# output helper functions
# print a line of dashes
print_dashes() {
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}
# echo a warning message
print_warning() {
  print_dashes
  echo -e "${YELLOW}WARNING: $1${NC}"
  print_dashes
}
# echo an error message
print_error() {
  print_dashes
  echo -e "${RED}ERROR: $1${NC}"
  print_dashes
}
# echo a success message
print_success() {
  print_dashes
  echo -e "${GREEN}SUCCESS: $1${NC}"
  print_dashes
}

# set up the the console font size
setfont ter-132b

# set up the network connection
# check if the network connection is up
if ! ping -c 1 google.com &> /dev/null; then
  print_warning "The network connection is down. Please check your network connection."
  exit 1
fi

# update the system clock
timedatectl set-ntp true
print_success "The system clock has been updated successfully."
# set up the time zone
timedatectl set-timezone Africa/Casablanca

# check if the system booted in uefi mode
if [ -d /sys/firmware/efi/efivars ]; then
  print_success "The system booted in UEFI mode."
else
  print_error "The system did not boot in UEFI mode. Please boot in UEFI mode."
  exit 1
fi

# these are helper functions for checking with the user using loops
# ask the user for a yes or no answer
ask_yes_no() {
  while true; do
    print_warning "$1 (y/n)"
    read -r answer
    case $answer in
    [Yy]*)
      return 0
      ;;
    [Nn]*)
      return 1
      ;;
    *)
      print_warning "Please enter y or n."
      ;;
    esac
  done
}
# execute a list of commands untill they all return a success status
execute_commands() {
  for command in "$@"; do
    if ! $command; then
      print_error "The command $command failed."
      return 1
    fi
  done
  return 0
}

# partition the disk
# list the available disks
lsblk
print_warning "Please enter the disk you want to partition (e.g. /dev/sda):"
read -r disk
# check if the disk exists
if [ ! -b "$disk" ]; then
  print_error "The disk $disk does not exist."
  exit 1
fi
# ask the user if they want to partition the disk
# if the user answers no, exit the script
if ! ask_yes_no "Do you want to partition the disk $disk?"; then
  exit 0
fi
# partition the disk
# create the partition table
# we will create 3 partitions: boot, swap and root
# we will use gpt as the partition table
# we will create a 512M boot partition, a 4G swap partition and a root partition with the remaining space using the btrfs file system
# first let us allow the user to perform the partitioning manually
# this way they will be no mistakes
# we will assume that the user has partitioned the disk correctly
# making the file systems
mkfs.fat -F32 "${disk}1"
mkswap "${disk}2"
swapon "${disk}2"
mkfs.btrfs -L arch "${disk}3"
mount "${disk}3" /mnt
cd /mnt
btrfs subvolume create _active
btrfs subvolume create _active/rootvol
btrfs subvolume create _active/homevol
btrfs subvolume create _snapshots
cd ..
unmount /mnt
mount -o subvol=_active/rootvol "${disk}3" /mnt
mkdir /mnt/home
mkdir /mnt/boot
mkdir /mnt/boot/efi
mkdir /mnt/mnt/defvol
mount -o subvol=_active/homevol "${disk}3" /mnt/home
mount "${disk}1" /mnt/boot/efi
mount -o subvol=_snapshots "${disk}3" /mnt/mnt/defvol
print_success "The disk $disk has been partitioned successfully."

# install the base system
# install the base packages
pacstrap /mnt base linux linux-firmware intel-ucode btrfs-progs vim grub efibootmgr networkmanager sudo git 
print_success "The base system has been installed successfully."

# generate the fstab file
genfstab -U /mnt >> /mnt/etc/fstab
print_success "The fstab file has been generated successfully."

# this is the part of the script that will be executed in the chroot environment
cat <<ENDE > /mnt/chroot.sh
#!/usr/bin/env bash
# setting the password for the root user
echo "Please enter the password for the root user:"
passwd
# setting the hostname
# ask the user for the hostname
echo "Please enter the hostname:"
read -r hostname
echo "\$hostname" > /etc/hostname
# setting the locale
# uncomment the en_US.UTF-8 UTF-8 locale
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
# generate the locale
locale-gen
# set the LANG variable
echo "LANG=en_US.UTF-8" > /etc/locale.conf
# set the timezone
ln -sf /usr/share/zoneinfo/Africa/Casablanca /etc/localtime
# set the hardware clock
hwclock --systohc
# set up the network configuration
systemctl enable NetworkManager
# setting up the users
# ask the user for the username
echo "Please enter the username:"
read -r username
# create the user
useradd -m -G wheel -s /bin/bash "\$username"
# set the password for the user
echo "Please enter the password for the user \$username:"
passwd "\$username"
# allow the users in the wheel group to use sudo
sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
# install the bootloader
# install grub
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
# generate the grub configuration file
# we will use the UUID of the root partition
# get the UUID of the root partition
root_uuid="\$(lsblk -no UUID "${disk}3")"
grub-mkconfig -o /boot/grub/grub.cfg
# generate the initramfs
# we will use the btrfs hook
sed -i 's/HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)/HOOKS=(base udev autodetect modconf block btrfs filesystems keyboard fsck)/' /etc/mkinitcpio.conf
# generate the initramfs
mkinitcpio -p linux
# checking if the boot entry is correct using efibootmgr
efibootmgr
# ask the user if the boot entry is correct
if ! ask_yes_no "Is the boot entry correct?"; then
  exit 1
fi
# exit the chroot environment
exit
ENDE
chmod +x /mnt/chroot.sh
arch-chroot /mnt /chroot.sh
print_success "The base system has been configured successfully."

