#!/bin/bash
sudo pacman -S sway swaybg swayidle swaylock waybar mako alacritty wofi playerctl brightnessctl gedit wl-clipboard xorg-xwayland qt5-wayland qt6-wayland gnome-passwordsafe pamixer
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si
yay -S wlsunset gfeeds wob
exit
