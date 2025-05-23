#!/bin/bash

echo "🌀 Updating system..."
pacman -Syu --noconfirm

echo "📦 Đang cài đặt dotfiles..."

sudo pacman -S --needed hyprland waybar kitty fish ttf-jetbrains-mono-nerd hyprpaper
# Hyprland
mkdir -p ~/.config/hypr
cp -r ./hypr/* ~/.config/hypr/

# Waybar
rm -rf ~/.config/waybar/*
mkdir -p ~/.config/waybar
cp -r ./waybar/* ~/.config/waybar/

# Kitty
rm -rf ~/.config/kitty/*
mkdir -p ~/.config/kitty
cp -r ./kitty/* ~/.config/kitty/

# Fish
rm -rf ~/.config/fish/*
mkdir -p ~/.config/fish
cp -r ./fish/* ~/.config/fish/

sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

if ! command -v yay &>/dev/null; then
    echo "Cài yay..."
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm
    cd .. && rm -rf yay
fi

chsh -s /usr/bin/fish
echo -e "\e[32m✅ All done! Enjoy your setup 🚀\e[0m"
