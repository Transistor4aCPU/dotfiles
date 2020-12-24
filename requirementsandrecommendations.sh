#!/bin/bash
sudo pacman -S sway swaybg swayidle swaylock waybar mako alacritty wofi playerctl brightnessctl wl-clipboard xorg-xwayland pamixer dex curl
# sudo pacman -S qt5-wayland qt6-wayland
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si
yay -S wlsunset wob macho grimshot
exit
