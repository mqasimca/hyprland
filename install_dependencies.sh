#!/bin/bash

# Core Hyprland packages (0.53+)
sudo pacman -Syyu --needed \
    hyprland \
    hyprland-guiutils \
    hyprpaper \
    hyprpolkitagent \
    xdg-desktop-portal-hyprland \
    waybar \
    wireplumber \
    playerctl \
    grim \
    slurp \
    wl-clipboard \
    cliphist \
    mako

# Hyprland ecosystem tools
sudo pacman -S --needed \
    hyprlock \
    hypridle \
    hyprpicker \
    hyprsunset \
    hyprlauncher \
    hyprcursor

# Screenshot tools (OCR, annotation)
sudo pacman -S --needed \
    swappy \
    tesseract \
    tesseract-data-eng

# Applications
sudo pacman -S --needed \
    alacritty \
    firefox \
    nautilus

# Qt Wayland support
sudo pacman -S --needed \
    qt5-wayland \
    qt6-wayland

# Fonts and icons for Waybar
sudo pacman -S --needed \
    ttf-font-awesome \
    ttf-nerd-fonts-symbols \
    papirus-icon-theme

# Build tools for hyprpm plugins (optional)
sudo pacman -S --needed \
    cmake \
    meson \
    cpio \
    pkg-config \
    git \
    gcc

# Power management
sudo pacman -S --needed \
    power-profiles-daemon

# Menu system (for quick settings)
sudo pacman -S --needed \
    wofi

# GTK/Qt theming tools
sudo pacman -S --needed \
    nwg-look \
    kvantum \
    qt5ct \
    qt6ct

# Catppuccin themes (AUR - requires paru/yay)
if command -v paru &> /dev/null; then
    paru -S --needed \
        catppuccin-gtk-theme-mocha \
        catppuccin-cursors-mocha \
        kvantum-theme-catppuccin-git \
        papirus-folders-catppuccin-git
elif command -v yay &> /dev/null; then
    yay -S --needed \
        catppuccin-gtk-theme-mocha \
        catppuccin-cursors-mocha \
        kvantum-theme-catppuccin-git \
        papirus-folders-catppuccin-git
else
    echo "No AUR helper found. Install paru or yay to install Catppuccin themes."
fi
