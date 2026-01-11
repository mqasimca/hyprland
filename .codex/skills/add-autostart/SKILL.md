---
name: add-autostart
description: Add an application to start automatically when Hyprland launches. Use when the user wants to autostart a program, service, or script.
---

# Add Autostart Skill

Add applications to Hyprland's autostart configuration.

## Instructions

1. **Read current autostart configuration**:
   ```bash
   cat hypr/config/autostart.conf
   ```

2. **Determine the command**:
   - Full path for scripts: `~/.config/hypr/scripts/myscript.sh`
   - Package name for installed apps: `waybar`, `mako`, etc.
   - Check if already present to avoid duplicates

3. **Add the autostart entry**:
   ```
   exec-once = command
   ```

4. **Validate**:
   ```bash
   hyprctl configerrors
   ```

5. **Test** by logging out and back in, or run the command manually

## Autostart Types

### exec-once (Run once at startup)
```bash
exec-once = waybar
exec-once = mako
exec-once = hypridle
exec-once = hyprpaper
```

### exec (Run every reload - rarely needed)
```bash
exec = pkill waybar; waybar
```

## Common Autostart Entries

### Core Services
```bash
# Status bar
exec-once = waybar

# Notification daemon
exec-once = mako

# Wallpaper
exec-once = hyprpaper

# Idle daemon (screen lock/dim)
exec-once = hypridle

# Clipboard manager
exec-once = wl-paste --watch cliphist store

# Authentication agent
exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# Screen sharing portal
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
```

### Applications
```bash
# Discord (minimized to tray)
exec-once = discord --start-minimized

# Spotify
exec-once = spotify

# Network manager applet
exec-once = nm-applet --indicator

# Bluetooth applet
exec-once = blueman-applet
```

### Scripts
```bash
# Custom startup script
exec-once = ~/.config/hypr/scripts/startup.sh

# Set random wallpaper
exec-once = ~/.config/hypr/scripts/random-wallpaper.sh
```

### Environment Setup
```bash
# Import environment to systemd
exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# GTK settings
exec-once = gsettings set org.gnome.desktop.interface gtk-theme 'Catppuccin-Mocha-Standard-Mauve-Dark'
```

## Conditional Autostart

### With delay
```bash
exec-once = sleep 2 && discord --start-minimized
```

### Check if not running
```bash
exec-once = pgrep -x waybar || waybar
```

### With environment variables
```bash
exec-once = env QT_QPA_PLATFORM=wayland qbittorrent
```

## Ordering Considerations

Order matters for dependencies:
1. Portal/dbus setup first
2. Core services (waybar, mako)
3. Background services (hypridle, clipboard)
4. Applications last

## Creating a Startup Script

For complex startup logic, create `hypr/scripts/startup.sh`:

```bash
#!/bin/bash

# Wait for Hyprland
sleep 1

# Start services
waybar &
mako &

# Start apps with delays
sleep 2
discord --start-minimized &
```

Make executable:
```bash
chmod +x hypr/scripts/startup.sh
```

Then in autostart:
```bash
exec-once = ~/.config/hypr/scripts/startup.sh
```

## Checking Running Processes

```bash
# Check if already running
pgrep -x processname

# List all user processes
ps aux | grep username
```
