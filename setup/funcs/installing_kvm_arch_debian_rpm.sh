#!/usr/bin/env bash

################################################################################
# `lscpu` --> see if virtualization is enabled [VT-x for intel & AMD-V for AMD]
# use the virtio-win driver for windows guests; it is a song and dance so fuck WINDOWS
# ARCH: wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso
# you need to add these kernel parameters to grub [intel_iommu=on iommu=pt]; do it in the installation stage
# sudo vim /etc/default/grub
################################################################################



# ARCH    DEBIAN/UBUNTU    RPM
DISTRO="ARCH"


if [[ "$DISTRO" == "ARCH" ]];then
    # installing software
    sudo pacman  -S --needed --noconfirm qemu-full libvirt virt-install virt-manager virt-viewer \
        edk2-ovmf swtpm qemu-img guestfs-tools libosinfo
    yay -S --needed --noconfirm tuned
    # enable the modular daemon
    for drv in qemu interface network nodedev nwfilter secret storage; do \
        sudo systemctl enable virt${drv}d.service; \
        sudo systemctl enable virt${drv}d{,-ro,-admin}.socket; \
    done
    # update grub after enabling the appropriate kernel params
    sudo grub-mkconfig -o /boot/grub/grub.cfg

else if [[ "$DISTRO" == "DEBIAN" ]];then
    # installing software
    sudo apt install qemu-system-x86 libvirt-daemon-system virtinst \
        virt-manager virt-viewer ovmf swtpm qemu-utils guestfs-tools \
        libosinfo-bin tuned
    # enable the monolithic daemon
    sudo systemctl enable --now libvirt.service
    # update grub after enabling the appropriate kernel params
    sudo update-grub


else if [[ "$DISTRO" == "RPM" ]];then
    # installing software
    sudo dnf install qemu-kvm libvirt virt-install virt-manager virt-viewer \
        edk2-ovmf swtpm qemu-img guestfs-tools libosinfo tuned
    # enabling the modular daemon
    for drv in qemu interface network nodedev nwfilter secret storage; do \
        sudo systemctl enable virt${drv}d.service; \
        sudo systemctl enable virt${drv}d{,-ro,-admin}.socket; \
    done
    # update grub after enabling the appropriate kernel params
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg

fi

# enabling the tuned daemon and setting it up
sudo systemctl enable --now tuned
sudo tuned-adm profile virtual-host




