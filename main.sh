#!/bin/bash
loadkeys fr-latin9;
parted /dev/sda mklabel msdos;
parted /dev/sda mkpart primary ext4 0% 90%;
parted /dev/sda mkpart primary linux-swapm  90% 100%;
mkfs.ext4 /dev/sda1;
mkswap /dev/sda2;
mount /dev/sda1;
genfstab -U -p /mnt >> /mnt/etc/fstab;
arch-chroot /mnt;
reboot;
# lsblk to list all parts
