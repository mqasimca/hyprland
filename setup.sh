#!/bin/bash

# Install dependencies
bash install_dependencies.sh

# Link hypr folder to ~/.config/hypr, if it doesn't exist
if [ ! -d ~/.config/hypr ]; then
  ln -sf $(pwd)/hypr ~/.config/hypr
fi

# Link waybar folder to ~/.config/waybar, if it doesn't exist
if [ ! -d ~/.config/waybar ]; then
  ln -sf $(pwd)/waybar ~/.config/waybar
fi

# Link mako folder to ~/.config/mako, if it doesn't exist
if [ ! -d ~/.config/mako ]; then
  ln -sf $(pwd)/mako ~/.config/mako
fi

# Link alacritty folder to ~/.config/alacritty, if it doesn't exist
if [ ! -d ~/.config/alacritty ]; then
  ln -sf $(pwd)/alacritty ~/.config/alacritty
fi

# Link walker folder to ~/.config/walker, if it doesn't exist
if [ ! -d ~/.config/walker ]; then
  ln -sf $(pwd)/walker ~/.config/walker
fi
