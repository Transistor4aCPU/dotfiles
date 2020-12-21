#!/bin/bash
sudo pacman -S sway swaybg swayidle swaylock waybar mako alacritty wofi playerctl brightnessctl wl-clipboard xorg-xwayland pamixer
# sudo pacman -S gedit qt5-wayland qt6-wayland sddm gnome-passwordsafe
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si
yay -S wlsunset wob
# yay -S gfeeds sddm-theme-redrock
exit
