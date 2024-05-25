#!/usr/bin/env bash


############################################################
### basic setup for the env itself
############################################################
# setting up the font inside the live env
read -p "Is the text small for your taste Mr Redaa? [Y/n] " text_small
if [ $text_small = "n" ]
then
    echo -e "Ok, we will continue using this font size Mr Reda\n"
    sleep 3
    clear
else 
    # making the font get bigger
    echo -e "making the font get bigger\n"
    echo -e "this is the font before:"
    sleep 3
    setfont ter-132b
    echo -e "this is the font after"
    sleep 3
    clear
fi

# set up the time
echo -e "configuring the time has begun\n"
sleep 3
timedatectl
# setting the ntp protocol true
echo -e "setting the ntp protocol true\n"
timedatectl set-ntp true
# setting up the time zone
echo -e "setting up the time zone\n"
timedatectl set-timezone Africa/Casablanca
echo -e "setting up the time has finished"
sleep 3
clear

# updating keyrings
echo -e "updating the keyrings \n"
sleep 3
pacman -Sy --needed --noconfirm archlinux-keyring
echo -e "just updated the keyring for arch \nwhatever that means!\n"
sleep 3
clear
