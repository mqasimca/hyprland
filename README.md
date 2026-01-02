# Hyprland Configuration

Personal Hyprland configuration files for Hyprland 0.53.0.

## Setup

```bash
# Install all dependencies (Arch Linux)
./install_dependencies.sh

# Set up symlinks to ~/.config/
./setup.sh
```

## Verify Installation

```bash
# Check Hyprland version
hyprctl version

# Check for config errors
hyprctl configerrors

# Reload configuration
hyprctl reload
```

## Keybindings

> **Note:** `Super` refers to the **Windows key** (⊞) on most keyboards, or the **Command key** (⌘) on Mac.

### Applications

| Keybind | Action |
|---------|--------|
| `Super + Return` | Open terminal (Alacritty) |
| `Super + B` | Open browser (Firefox) |
| `Super + E` | Open text editor (VS Code) |
| `Super + F` | Open file manager (Nautilus) |
| `Super + Space` | Open application launcher |

### Window Management

| Keybind | Action |
|---------|--------|
| `Super + K` | Close active window |
| `Super + Shift + F` | Toggle fullscreen |
| `Super + Ctrl + F` | Toggle floating mode |
| `Super + J` | Toggle split direction (horizontal/vertical) |
| `Super + Arrow Keys` | Move focus (left/right/up/down) |
| `Super + Shift + Arrow Keys` | Move window (left/right/up/down) |
| `Super + Left Mouse Button` | Drag to move window |

### Window Resizing

| Keybind | Action |
|---------|--------|
| `Super + Ctrl + Shift + Right` | Resize window to the right |
| `Super + Ctrl + Shift + Left` | Resize window to the left |
| `Super + Ctrl + Shift + Up` | Resize window upwards |
| `Super + Ctrl + Shift + Down` | Resize window downwards |

### Window Groups (Tabbed Windows)

| Keybind | Action |
|---------|--------|
| `Super + G` | Toggle window group |
| `Super + Shift + G` | Lock active group |
| `Super + Tab` | Cycle through grouped windows |
| `Super + Shift + Tab` | Cycle through grouped windows (reverse) |
| `Super + Ctrl + Arrow Keys` | Move window into group (direction) |

### Workspaces

| Keybind | Action |
|---------|--------|
| `Super + 1-9, 0` | Switch to workspace 1-10 |
| `Super + Shift + 1-9, 0` | Move window to workspace 1-10 |

### Screenshots

| Keybind | Action |
|---------|--------|
| `Print` | Select region, copy to clipboard |
| `Shift + Print` | Full screen, copy to clipboard |
| `Super + Print` | Select region, save to file |
| `Super + Shift + Print` | Full screen, save to file |

### Volume Control

| Keybind | Action |
|---------|--------|
| `XF86AudioRaiseVolume` | Increase volume by 5% |
| `XF86AudioLowerVolume` | Decrease volume by 5% |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle microphone mute |

### Media Controls

| Keybind | Action |
|---------|--------|
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86AudioStop` | Stop playback |

### Utilities

| Keybind | Action |
|---------|--------|
| `Super + C` | Color picker |
| `Super + V` | Clipboard history |
| `Super + Shift + N` | Toggle night mode (warm colors) |

### System

| Keybind | Action |
|---------|--------|
| `Super + L` | Lock screen |
| `Super + Shift + L` | Power menu (shutdown/reboot/logout) |
| `Super + I` | Show system info |
