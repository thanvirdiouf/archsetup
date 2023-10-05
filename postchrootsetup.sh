#!/bin/bash
passwd
useradd -m Spectre
usermod -aG wheel,storage,power Spectre
EDITOR=nano visudo
nano /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
echo ArchNitroSys > /etc/hostname
mv hosts /etc/
ln -sf /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
hwclock --systohc
mkdir /boot/efi
mount /dev/nvme0n1p1 /boot/efi
lsblk
function pause(){
   read -p "$*"
}
pause 'Press [Enter] key to continue...'
pacman -S pacman-contrib
rankmirrors -n 10 mirrorlist.bak > /etc/pacman.d/mirrorlist
nano /etc/pacman.conf
pacman -S grub efibootmgr dosfstools mtools i3-wm i3-gapps dmenu lightdm lightdm-gtk-greeter zsh lsd neovim kitty
pause 'Press [Enter] key to continue...'
nano /etc/default/grub
pacman -S os-prober
grub-install --target=x86_64-efi --bootloader-id=linux --recheck
pause 'Press [Enter] key to continue...'
grub-mkconfig -o /boob/grub/grub.cfg
systemctl enable dhcpcd
systemctl enable NetworkManager
nano /etc/lightdm/lightdm.conf 
