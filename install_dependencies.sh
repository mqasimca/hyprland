#!/bin/bash

# Core Hyprland packages (0.53+)
sudo pacman -Syyu --needed \
    hyprland \
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
    code \
    firefox \
    nautilus \
    pavucontrol \

# CLI/utility deps used by scripts and Waybar
sudo pacman -S --needed \
    jq \
    curl \
    iputils \
    xdg-utils \
    libnotify \
    alsa-utils

# Qt Wayland support
sudo pacman -S --needed \
    qt5-wayland \
    qt6-wayland

# GTK portals for file pickers/screenshare dialogs
sudo pacman -S --needed \
    xdg-desktop-portal-gtk

# GTK/Qt theming tools (used by environment.conf)
sudo pacman -S --needed \
    kvantum \
    qt5ct

# Fonts and icons used by Waybar/Mako/Hyprlock
sudo pacman -S --needed \
    ttf-jetbrains-mono-nerd \
    ttf-fira-sans \
    ttf-meslo-nerd \
    ttf-sarasa-gothic \
    ttf-font-awesome \
    ttf-nerd-fonts-symbols \
    papirus-icon-theme

# Power management
sudo pacman -S --needed \
    power-profiles-daemon

# NVIDIA tooling (used by Waybar GPU modules)
sudo pacman -S --needed \
    nvidia-utils

# Optional extras (uncomment as needed)
# sudo pacman -S --needed \
#     lm_sensors \
#     xsensors
#
# sudo pacman -S --needed \
#     cmake \
#     meson \
#     cpio \
#     pkg-config \
#     git \
#     gcc
#
# sudo pacman -S --needed \
#     nwg-look \
#     qt6ct

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
