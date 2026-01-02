#!/bin/bash

# Install dependencies
#bash install_dependencies.sh

# Create Screenshots directory
mkdir -p ~/Pictures/Screenshots

# Link hypr folder to ~/.config/hypr
if [ ! -d ~/.config/hypr ]; then
  ln -sf $(pwd)/hypr ~/.config/hypr
fi

# Link waybar folder to ~/.config/waybar
if [ ! -d ~/.config/waybar ]; then
  ln -sf $(pwd)/waybar ~/.config/waybar
fi

# Link alacritty folder to ~/.config/alacritty
if [ ! -d ~/.config/alacritty ]; then
  ln -sf $(pwd)/alacritty ~/.config/alacritty
fi

# Link mako folder to ~/.config/mako
if [ ! -d ~/.config/mako ]; then
  ln -sf $(pwd)/mako ~/.config/mako
fi

