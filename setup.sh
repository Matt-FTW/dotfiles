#!/bin/bash

BASE_SETUP="
hyprland
pyprland
hyprlock
hypridle
xdg-desktop-portal-hyprland
hyprpicker
swww
waybar
rofi-wayland
swaync
wl-clipboard
cliphist
swayosd-git
brightnessctl
udiskie
devify
polkit-gnome
playerctl
pyprland
grim
slurp
greetd
greetd-tui
systemd

pipewire
pipewire-alsa
pipewire-pulse
pipewire-jack
wireplumber 
alsa-utils

fastfetch
fzf
jq
eza
fd
vivid
fish
starship
ripgrep
bat
yazi

pavucontrol
satty
nautilus
zathura
zathura-pdf-mupdf
qimgv-light
mpv

catppuccin-gtk-theme-macchiato
catppuccin-cursors-macchiato
qt5ct
qt5-wayland
qt6-wayland
kvantum
kvantum-qt5
nwg-look

ttf-jetbrains-mono-nerd
ttf-nerd-fonts-symbols
ttf-nerd-fonts-symbols-mono
ttf-nerd-fonts-symbols-common
ttf-font-awesome
noto-fonts-cjk
ttf-ms-win11-auto

thunderbird
spotube
keepassxc
"

sudo pacman --needed -Syu yay
yay -Syu --sudoloop --noconfirm --needed $BASE_SETUP

fc-cache -fv

systemctl --user enable --now pipewire wireplumber
systemctl enable greetd.service

curl -LJO https://github.com/ljmill/catppuccin-icons/releases/download/v0.2.0/Catppuccin-SE.tar.bz2
tar -xf Catppuccin-SE.tar.bz2
mv Catppuccin-SE ~/.local/share/icons/

pypr update
