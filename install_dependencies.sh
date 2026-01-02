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
