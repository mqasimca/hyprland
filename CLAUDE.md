# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Hyprland (Wayland compositor) configuration repository for Arch Linux. It contains dotfiles for Hyprland and related tools.

## Version Information

- **Hyprland Version**: 0.53.0
- **Window Rules**: Uses 0.53+ syntax (see windowrules.conf)
- **Configuration Status**: Fully validated, 0 errors
- **Last Updated**: January 2026

## Setup Commands

```bash
# Install all dependencies (Arch Linux with pacman)
./install_dependencies.sh

# Set up symlinks to ~/.config/
./setup.sh
```

## Configuration Architecture

The main Hyprland config (`hypr/hyprland.conf`) sources modular config files from `hypr/config/`:

| File | Purpose |
|------|---------|
| `defaults.conf` | Variables: $mainMod, $terminal, $browser, etc. |
| `keybinds.conf` | All keyboard shortcuts |
| `windowrules.conf` | Window rules and workspace assignments |
| `autostart.conf` | Applications launched at startup |
| `monitors.conf` | Monitor configuration |
| `animations.conf` | Animation settings |
| `decorations.conf` | Window decorations (borders, shadows, blur) |
| `variables.conf` | General Hyprland variables |
| `input.conf` | Keyboard/mouse/touchpad settings |
| `misc.conf` | Miscellaneous settings |
| `mocha.conf` | Catppuccin Mocha color definitions |
| `workspaces.conf` | Workspace rules |
| `environment.conf` | Environment variables |

Standalone Hyprland ecosystem configs in `hypr/`:
- `hyprlock.conf` - Lock screen
- `hypridle.conf` - Idle daemon
- `hyprpaper.conf` - Wallpaper
- `hyprlauncher.conf` - Application launcher
- `hyprtoolkit.conf` - Toolkit settings

Other application configs:
- `waybar/` - Status bar
- `alacritty/` - Terminal emulator
- `mako/` - Notification daemon

## Key Variables (defaults.conf)

- `$mainMod` = SUPER (Windows key)
- `$terminal` = alacritty
- `$browser` = firefox
- `$filemanager` = nautilus
- `$textEditor` = code
- `$applauncher` = hyprlauncher
