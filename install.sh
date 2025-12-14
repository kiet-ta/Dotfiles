#!/bin/bash

# --- CONFIGURATION ---
DOTFILES_DIR="$HOME/my-dotfiles"
LOG_FILE="install.log"

# --- HELPER FUNCTIONS ---
log() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

error() {
    echo -e "\e[31m[ERROR]\e[0m $1"
}

# 1. Kiểm tra quyền Root (Safety Check)
if [ "$EUID" -eq 0 ]; then
    error "Vui lòng KHÔNG chạy script này bằng sudo!"
    error "Hãy chạy: ./install.sh (Script sẽ tự hỏi pass sudo khi cần)"
    exit 1
fi

# 2. Update System
log "🌀 Updating system..."
sudo pacman -Syu --noconfirm

# 3. Cài đặt các gói cơ bản (Official Repo)
log "📦 Installing Core Packages..."
PACKAGES=(
    "hyprland"
    "waybar"
    "kitty"
    "fish"
    "ttf-jetbrains-mono-nerd"
    "stow" # Quan trọng: Cần stow để link config
    "git"
    "base-devel"
    "hyprlock"     # Màn hình khóa
    "hypridle"     # Tự động khóa
    "wl-clipboard" # Clipboard
    "cliphist"     # Clipboard Manager
    "pipewire"     # Audio
    "wireplumber"
    "polkit-kde-agent" # Auth Agent (hoặc hyprpolkitagent)
    "unzip"
)

# Cài gói (loại bỏ những gói đã cài rồi để chạy cho nhanh)
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# 4. Cài đặt YAY (AUR Helper) nếu chưa có
if ! command -v yay &>/dev/null; then
    log "⚡ Installing yay (AUR Helper)..."
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si --noconfirm
    cd .. && rm -rf yay
else
    log "✅ Yay is already installed."
fi

log "✨ Installing AUR Packages..."
AUR_PACKAGES=(
    "wlogout"
    "swayosd"
    "mpvpaper"
    "sddm-astronaut-theme-git"
)

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

log "🔗 Linking Dotfiles using GNU Stow..."

log "   -> Backing up old configs to ~/.config_backup..."
mkdir -p ~/.config_backup
[ -d ~/.config/hypr ] && mv ~/.config/hypr ~/.config_backup/
[ -d ~/.config/waybar ] && mv ~/.config/waybar ~/.config_backup/
[ -d ~/.config/kitty ] && mv ~/.config/kitty ~/.config_backup/
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config_backup/

# Chạy Stow
cd "$DOTFILES_DIR" || exit
stow hypr
stow waybar
stow kitty
stow nvim

log "✅ Dotfiles linked successfully!"

# 7. Setup Shell
if [ "$SHELL" != "/usr/bin/fish" ]; then
    log "🐠 Changing default shell to Fish..."
    chsh -s /usr/bin/fish
fi

log "🚀 SETUP COMPLETE! Please reboot your system."chsh -s /usr/bin/fish
echo -e "\e[32m✅ All done! Enjoy your setup 🚀\e[0m"

# if want to download wofi config to dotfiles, run these commands:
# mkdir -p ~/my-dotfiles/wofi/.config
# mv ~/.config/wofi ~/my-dotfiles/wofi/.config/
# cd ~/my-dotfiles && stow wofi
