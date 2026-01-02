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
    hyprshutdown \
    hyprsysteminfo \
    hyprcursor
