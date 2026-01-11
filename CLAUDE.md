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

## Configuration Validation

**IMPORTANT**: After every configuration change, you MUST verify there are no errors:

```bash
hyprctl configerrors
```

This command should return no errors. If errors are found, they must be fixed immediately before proceeding.

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
- `hyprlauncher.conf` - Application launcher (deprecated in favor of hyprlauncher/ directory)
- `hyprtoolkit.conf` - Toolkit theme settings (used by hyprlauncher and other Hyprland GUI apps)

Other application configs:
- `waybar/` - Status bar
- `alacritty/` - Terminal emulator
- `mako/` - Notification daemon
- `hyprlauncher/` - Application launcher with Catppuccin Mocha theming

## Key Variables (defaults.conf)

- `$mainMod` = SUPER (Windows key)
- `$terminal` = alacritty
- `$browser` = firefox
- `$filemanager` = nautilus
- `$textEditor` = code
- `$applauncher` = hyprlauncher

## Theming

This configuration uses **Catppuccin Mocha** theme consistently across all applications:

### Hyprtoolkit Theme
The `hyprtoolkit.conf` file provides system-wide theming for Hyprland GUI applications:
- **Format**: Flat key-value pairs (NOT sections like `colors { }`)
- **Color format**: `0xAARRGGBB` (hex with alpha channel)
- **Used by**: hyprlauncher, hyprlock, and other Hyprland GUI tools
- **Font**: JetBrainsMono Nerd Font
- **Icons**: Papirus-Dark

### Hyprlauncher Theme
The `hyprlauncher/config.json` applies Catppuccin Mocha colors to the application launcher:
- Window styling: rounded corners, border, transparency
- Color scheme: matches waybar and other components
- Custom CSS available in `hyprlauncher/style.css` (currently not in use, using theme colors instead)

## Window Layout

### Dwindle Layout (Default)
The dwindle layout is optimized for automatic grid-like tiling:

**Key settings in `variables.conf`:**
- `smart_split = true` - Splits based on window aspect ratio for balanced layouts
- `force_split = 2` - Consistently splits right/bottom for predictable behavior
- `default_split_ratio = 1.0` - Creates equal-sized windows by default
- `preserve_split = true` - Maintains manual split adjustments
- `smart_resizing = true` - Intelligent resize direction detection

**Result**: Opening 4 windows automatically creates a 2x2 grid layout. Use `Super + J` to manually toggle split direction when needed.

## Key Features

- **Window Swallowing**: Terminals hide when launching GUI apps (`misc.conf`)
- **Scratchpad**: `Super+S` toggles dropdown workspace, `Super+Shift+S` moves window to it
- **Submaps**: `Super+R` for resize mode, `Super+M` for move mode (arrow keys, Escape to exit)
- **Screen Dimming**: Dims at 4.5 min, locks at 5 min (`hypridle.conf`)
- **Smart Window Rules**: Spotify→WS9, Discord→WS10, games auto-fullscreen
- **Color Picker**: `Super+C` (hex), `Super+Shift+C` (rgb), `Super+Ctrl+C` (hsl)
- **Window Pinning**: `Super+P` pins window to all workspaces
- **GPU Monitoring**: Waybar shows GPU usage and temperature
- **Quick Settings**: `Super+Q` opens hyprlauncher menu for toggling blur, animations, gaps, DND
- **Power Profiles**: `Super+Alt+P` switches between performance/balanced/power-saver
- **Do Not Disturb**: `Super+D` toggles mako notification muting
- **Session Management**: `Super+Alt+S` saves, `Super+Alt+R` shows session info
- **Enhanced Screenshots**: OCR (`Super+Alt+Print`), Annotate (`Super+Ctrl+Print`), Delayed (`Alt+Print`)

## Scripts

Custom scripts are located in `hypr/scripts/`:
- `quick-settings.sh` - Hyprlauncher-based settings toggle menu
- `dnd-toggle.sh` - Do Not Disturb toggle for mako
- `power-menu.sh` - Power profile switching
- `session-save.sh` - Save current window layout
- `session-restore.sh` - Show saved session info
