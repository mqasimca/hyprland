#!/bin/bash

# Core Hyprland packages (0.53+)
sudo pacman -Syyu --needed \
    hyprland \
    hyprland-guiutils \
    hyprpaper \
    hyprpolkitagent \
    xdg-desktop-portal-hyprland \
    waybar \
    rofi-wayland \
    brightnessctl \
    wireplumber \
    playerctl \
    grim \
    slurp \
    wl-clipboard

# Optional packages (uncomment as needed)
# sudo pacman -S --needed cliphist      # Clipboard history
# sudo pacman -S --needed mako          # Notification daemon
# sudo pacman -S --needed dunst         # Alternative notification daemon
