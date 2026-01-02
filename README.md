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
| `Super + P` | Pin window to all workspaces |
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

### Submaps (Modes)

| Keybind | Action |
|---------|--------|
| `Super + R` | Enter **resize mode** (use arrow keys, Escape to exit) |
| `Super + M` | Enter **move mode** (use arrow keys, Escape to exit) |

> **Tip:** In resize/move mode, use arrow keys freely without holding Super. Press Escape or Enter to exit.

### Workspaces

| Keybind | Action |
|---------|--------|
| `Super + 1-9, 0` | Switch to workspace 1-10 |
| `Super + Shift + 1-9, 0` | Move window to workspace 1-10 |

### Scratchpad (Dropdown Workspace)

| Keybind | Action |
|---------|--------|
| `Super + S` | Toggle scratchpad |
| `Super + Shift + S` | Move window to scratchpad |

> **Tip:** To move a window back from scratchpad, open it with `Super + S`, then use `Super + Shift + 1-0` to send it to a workspace.

### Screenshots

| Keybind | Action |
|---------|--------|
| `Print` | Select region, copy to clipboard |
| `Shift + Print` | Full screen, copy to clipboard |
| `Super + Print` | Select region, save to file |
| `Super + Shift + Print` | Full screen, save to file |
| `Super + Alt + Print` | OCR screenshot (extract text to clipboard) |
| `Super + Ctrl + Print` | Annotate screenshot (opens swappy) |
| `Alt + Print` | Delayed screenshot (3 seconds) |

> **Note:** OCR requires `tesseract` and annotation requires `swappy`. Install with `./install_dependencies.sh`.

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
| `Super + C` | Color picker (hex) |
| `Super + Shift + C` | Color picker (rgb) |
| `Super + Ctrl + C` | Color picker (hsl) |
| `Super + V` | Clipboard history |
| `Super + Shift + N` | Toggle night mode (warm colors) |

### System

| Keybind | Action |
|---------|--------|
| `Super + L` | Lock screen |
| `Super + I` | Show system info |

## Features

- **Catppuccin Mocha** theme across all applications
- **Window Swallowing** - Terminal hides when launching GUI apps from it
- **Scratchpad** - Quick dropdown workspace for temporary windows
- **Submaps** - Resize and move modes for easier window management
- **Screen Dimming** - Screen dims before locking (4.5 min idle)
- **Smart Window Rules** - Spotify→WS9, Discord→WS10, games auto-fullscreen
- **GPU Monitoring** - Waybar shows GPU usage and temperature
- **Variable Frame Rate (VFR)** - Power saving when idle
- **Adaptive Sync (VRR)** - Smooth visuals with compatible monitors
