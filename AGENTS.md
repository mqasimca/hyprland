# AGENTS.md

Instructions for AI coding agents working with this Hyprland configuration repository.

## Repository Overview

Personal Hyprland (Wayland compositor) dotfiles for Arch Linux. Contains modular configuration files for Hyprland and related ecosystem tools.

- **Hyprland Version**: 0.53.0
- **Theme**: Catppuccin Mocha
- **Shell**: bash scripts in `hypr/scripts/`

## Critical Requirement

**After EVERY configuration change, validate with:**

```bash
hyprctl configerrors
```

This must return no errors. Fix any errors immediately before proceeding.

---

# Hyprland Expert Reference

## Configuration Architecture

Main config: `hypr/hyprland.conf` sources modular files from `hypr/config/`:

| File | Purpose |
|------|---------|
| `defaults.conf` | Variables: `$mainMod`, `$terminal`, `$browser`, etc. |
| `keybinds.conf` | All keyboard shortcuts |
| `windowrules.conf` | Window rules (0.53+ syntax) |
| `autostart.conf` | Startup applications |
| `monitors.conf` | Monitor configuration |
| `animations.conf` | Animation settings |
| `decorations.conf` | Borders, shadows, blur |
| `variables.conf` | General Hyprland variables |
| `input.conf` | Keyboard/mouse/touchpad |
| `misc.conf` | Window swallowing, misc settings |
| `mocha.conf` | Catppuccin Mocha color definitions |
| `workspaces.conf` | Workspace rules |
| `environment.conf` | Environment variables |

Standalone configs in `hypr/`:
- `hyprlock.conf` - Lock screen
- `hypridle.conf` - Idle daemon
- `hyprpaper.conf` - Wallpaper
- `hyprtoolkit.conf` - System-wide GUI theming (flat key-value, `0xAARRGGBB` colors)

Other applications:
- `waybar/` - Status bar
- `alacritty/` - Terminal
- `mako/` - Notifications
- `hyprlauncher/` - App launcher

## Key Variables

Defined in `hypr/config/defaults.conf`:
- `$mainMod` = SUPER
- `$terminal` = alacritty
- `$browser` = firefox
- `$filemanager` = nautilus
- `$textEditor` = code
- `$applauncher` = hyprlauncher

Always use these variables instead of hardcoding application names.

---

## Complete Dispatcher Reference

### Bind Syntax
```
bind[flags] = MODS, KEY, dispatcher, params
bindd[flags] = MODS, KEY, description, dispatcher, params
```

**Bind Flags:**
- `(none)` - Standard keybind
- `e` - Repeats when held (binde)
- `l` - Works even when locked (bindl)
- `m` - Mouse bind (bindm)
- `r` - Release bind (bindr)
- `n` - No consume, passes to window (bindn)
- `d` - With description (bindd)

**Modifiers:** `SUPER`, `SHIFT`, `CTRL`, `ALT`, `$mainMod`

### Window Management Dispatchers

| Dispatcher | Parameters | Description |
|------------|------------|-------------|
| `exec` | `command` | Execute shell command (supports rules) |
| `execr` | `command` | Execute raw shell command (no rules) |
| `killactive` | - | Close active window gracefully |
| `forcekillactive` | - | Force kill active window |
| `closewindow` | `window` | Close specified window |
| `killwindow` | `window` | Kill specified window |
| `togglefloating` | `[active]` | Toggle floating state |
| `setfloating` | - | Set window to floating |
| `settiled` | - | Set window to tiled |
| `fullscreen` | `0\|1\|2` | Fullscreen (0=full, 1=maximize, 2=fake) |
| `fullscreenstate` | `internal client` | Decouple internal/client fullscreen state |
| `centerwindow` | `[1]` | Center floating window (1=respect reserved) |
| `pin` | - | Pin window to all workspaces (floating only) |

### Focus & Movement Dispatchers

| Dispatcher | Parameters | Description |
|------------|------------|-------------|
| `movefocus` | `l\|r\|u\|d` | Move focus in direction |
| `movewindow` | `l\|r\|u\|d\|mon:X` | Move window in direction or to monitor |
| `swapwindow` | `l\|r\|u\|d` | Swap with window in direction |
| `resizeactive` | `X Y` | Resize active window (pixels or %) |
| `moveactive` | `X Y` | Move active window |
| `resizewindowpixel` | `X Y,window` | Resize specified window |
| `movewindowpixel` | `X Y,window` | Move specified window |
| `cyclenext` | `[prev\|tiled\|floating]` | Cycle focus to next window |
| `swapnext` | `[prev]` | Swap with next window |
| `focuswindow` | `window` | Focus window matching pattern |
| `focusmonitor` | `monitor` | Focus specified monitor |
| `focuscurrentorlast` | - | Toggle focus current/last window |

### Workspace Dispatchers

| Dispatcher | Parameters | Description |
|------------|------------|-------------|
| `workspace` | `N\|+N\|-N\|name:X` | Switch to workspace |
| `movetoworkspace` | `N\|name:X` | Move window to workspace (follow) |
| `movetoworkspacesilent` | `N\|name:X` | Move window to workspace (stay) |
| `togglespecialworkspace` | `name` | Toggle special/scratchpad workspace |
| `renameworkspace` | `id name` | Rename workspace |
| `movecurrentworkspacetomonitor` | `monitor` | Move workspace to monitor |
| `moveworkspacetomonitor` | `workspace monitor` | Move specific workspace |
| `swapactiveworkspaces` | `mon1 mon2` | Swap workspaces between monitors |
| `focusworkspaceoncurrentmonitor` | `workspace` | Focus workspace on current monitor |

### Window Group (Tabbed) Dispatchers

| Dispatcher | Parameters | Description |
|------------|------------|-------------|
| `togglegroup` | - | Toggle window into/out of group |
| `changegroupactive` | `f\|b\|N` | Switch tab (forward/back/index) |
| `moveintogroup` | `l\|r\|u\|d` | Move window into adjacent group |
| `moveoutofgroup` | - | Move window out of group |
| `movewindoworgroup` | `l\|r\|u\|d` | Smart move into/out of group |
| `movegroupwindow` | `f\|b` | Reorder tabs in group |
| `lockgroups` | `lock\|unlock\|toggle` | Lock all groups |
| `lockactivegroup` | `lock\|unlock\|toggle` | Lock focused group |
| `denywindowfromgroup` | `on\|off\|toggle` | Prevent window from grouping |

### Layout Dispatchers

| Dispatcher | Parameters | Description |
|------------|------------|-------------|
| `togglesplit` | - | Toggle split direction (dwindle) |
| `splitratio` | `+X\|-X\|exact X` | Adjust split ratio |
| `swapsplit` | - | Swap split children (dwindle) |
| `orientationcycle` | `[orientations...]` | Cycle master orientation |
| `layoutmsg` | `message` | Send message to layout |

### System Dispatchers

| Dispatcher | Parameters | Description |
|------------|------------|-------------|
| `dpms` | `on\|off\|toggle [monitor]` | Control display power |
| `exit` | - | Exit Hyprland |
| `forcerendererreload` | - | Reload renderer resources |
| `forceidle` | `seconds` | Force idle timer elapsed |
| `submap` | `name\|reset` | Enter/exit submap mode |
| `global` | `name` | Trigger GlobalShortcuts portal |
| `pass` | `window` | Pass key to window |
| `sendshortcut` | `mods,key,window` | Send shortcut to window |

---

## Window Rules (0.53+ Syntax)

### Rule Format
```
windowrule = RULE [PARAMS], SELECTOR
```

### Selectors (match: prefix)
```
match:class ^(regex)$          # Window class
match:title ^(regex)$          # Window title
match:initialclass ^(regex)$   # Initial class
match:initialtitle ^(regex)$   # Initial title
match:tag tagname              # Tagged windows
match:floating 1               # Floating windows
match:fullscreen 1             # Fullscreen windows
match:pinned 1                 # Pinned windows
match:focus 1                  # Focused window
match:workspace N              # Windows on workspace N
match:workspace name:X         # Windows on named workspace
match:onworkspace w[fv1-10]    # Workspace range selector
```

### Available Rules

**Window State:**
```
float on|off                   # Floating state
fullscreen on|off              # Fullscreen state
maximize on|off                # Maximize state
pin on|off                     # Pin to all workspaces
```

**Positioning:**
```
center [1]                     # Center window (1=respect reserved)
move X Y                       # Absolute position
move X% Y%                     # Percentage position
size X Y                       # Window size
size X% Y%                     # Percentage size
minsize X Y                    # Minimum size
maxsize X Y                    # Maximum size
```

**Workspace Assignment:**
```
workspace N                    # Assign to workspace
workspace N silent             # Assign without switching
workspace name:X               # Named workspace
workspace special:name         # Special workspace
```

**Visual:**
```
opacity X [Y]                  # Active [inactive] opacity
rounding N                     # Corner radius
border_size N                  # Border thickness
border_color COLOR             # Border color
no_blur on                     # Disable blur
no_dim on                      # Disable dimming
no_shadow on                   # Disable shadow
```

**Animation:**
```
animation STYLE [PARAMS]       # Override animation
  # Styles: slide [direction], popin [%], fade [%]
  # Directions: left, right, top, bottom
```

**Behavior:**
```
tile                           # Force tiled
pseudo                         # Pseudotile
nofocus                        # Never focus
noinitialfocus                 # Don't focus on open
focusonactivate                # Focus on activation
stayfocused                    # Keep focus
dimaround                      # Dim other windows
suppressevent EVENT            # Suppress events (maximize, fullscreen, activate, activatefocus)
```

**Privacy & Sharing:**
```
no_screen_share on             # Hide from screenshare (0.50+)
xray on|off                    # See through blur
```

**Advanced:**
```
immediate on                   # Enable tearing for this window
group GROUP                    # Group membership
tag +tagname                   # Add tag
tag -tagname                   # Remove tag
```

### Example Window Rules
```bash
# Float and center file dialogs
windowrule = float on, match:title ^(Open File|Save File)$
windowrule = center 1, match:title ^(Open File|Save File)$

# Assign apps to workspaces
windowrule = workspace 9 silent, match:class ^(Spotify)$
windowrule = workspace 10 silent, match:class ^(discord|Discord)$

# Gaming optimization
windowrule = fullscreen on, match:class ^(steam_app_.*)$
windowrule = no_blur on, match:class ^(steam_app_.*)$
windowrule = immediate on, match:class ^(steam_app_.*)$

# Privacy - hide from screenshare
windowrule = no_screen_share on, match:class ^(KeePassXC|1Password)$

# Scratchpad styling
windowrule = float on, match:workspace name:special:scratchpad
windowrule = size 80% 80%, match:workspace name:special:scratchpad
windowrule = center 1, match:workspace name:special:scratchpad
windowrule = animation slide top, match:workspace name:special:scratchpad

# Decorations for floating windows
windowrule = border_size 2, match:float 1 match:onworkspace w[fv1-10]
windowrule = rounding 8, match:float 1 match:onworkspace w[fv1-10]
```

### Layer Rules
```bash
layerrule = blur, match:namespace waybar
layerrule = ignorezero, match:namespace waybar
layerrule = animation slide down, match:namespace waybar
```

---

## Configuration Variables

### General (`general { }`)
```
border_size = 2                # Border thickness (int, default: 1)
gaps_in = 5                    # Inner gaps (int, default: 5)
gaps_out = 10                  # Outer gaps (int, default: 20)
col.active_border = $mauve    # Active border (gradient)
col.inactive_border = $surface0  # Inactive border (gradient)
layout = dwindle               # Layout: dwindle|master
allow_tearing = true           # Enable tearing support
resize_on_border = true        # Resize by dragging border
```

### Decoration (`decoration { }`)
```
rounding = 10                  # Corner radius (int, default: 0)
active_opacity = 1.0           # Active window opacity (0.0-1.0)
inactive_opacity = 0.9         # Inactive opacity (0.0-1.0)
dim_inactive = true            # Dim inactive windows
dim_strength = 0.2             # Dim intensity (0.0-1.0)

blur {
    enabled = true
    size = 8                   # Blur distance
    passes = 2                 # Blur passes (more = smoother)
    noise = 0.02               # Noise intensity
    vibrancy = 0.2             # Color vibrancy
    new_optimizations = true
}

shadow {
    enabled = true
    range = 15                 # Shadow size
    render_power = 3           # Falloff
    color = rgba(0,0,0,0.5)
}
```

### Animations (`animations { }`)
```
enabled = true

bezier = ease, 0.25, 0.1, 0.25, 1
bezier = overshot, 0.05, 0.9, 0.1, 1.1
bezier = smoothOut, 0.36, 0, 0.66, -0.56

animation = windows, 1, 4, overshot, slide
animation = windowsOut, 1, 4, smoothOut, slide
animation = fade, 1, 4, ease
animation = workspaces, 1, 4, overshot, slide
animation = specialWorkspace, 1, 4, overshot, slidevert
```

### Input (`input { }`)
```
kb_layout = us
kb_options = caps:escape      # Caps as Escape
follow_mouse = 1               # Focus follows mouse (0-3)
sensitivity = 0.0              # Mouse sensitivity (-1.0 to 1.0)
accel_profile = flat           # flat|adaptive
repeat_rate = 50               # Key repeat rate
repeat_delay = 300             # Repeat delay ms

touchpad {
    natural_scroll = true
    tap-to-click = true
    disable_while_typing = true
    scroll_factor = 1.0
}
```

### Gestures (`gestures { }`)
```
workspace_swipe = true
workspace_swipe_fingers = 3
workspace_swipe_distance = 300
workspace_swipe_invert = true
workspace_swipe_cancel_ratio = 0.5
```

### Misc (`misc { }`)
```
vfr = true                     # Variable framerate
vrr = 1                        # Adaptive sync (0=off, 1=on, 2=fullscreen)
enable_swallow = true          # Terminal swallowing
swallow_regex = ^(Alacritty|kitty)$
focus_on_activate = false      # Don't steal focus
background_color = 0x1e1e2e    # Fallback background
```

### Dwindle Layout (`dwindle { }`)
```
pseudotile = true              # Pseudo-tiling
smart_split = true             # Split based on aspect ratio
force_split = 2                # 0=mouse, 1=left/top, 2=right/bottom
preserve_split = true          # Keep split direction
default_split_ratio = 1.0      # Default ratio
smart_resizing = true          # Smart resize direction
```

### Master Layout (`master { }`)
```
new_status = master            # New window: master|slave|inherit
new_on_top = false             # Add new to top of stack
mfact = 0.55                   # Master area ratio
orientation = left             # left|right|top|bottom|center
```

---

## hyprctl Commands

```bash
# Configuration
hyprctl configerrors           # Check for errors (CRITICAL)
hyprctl reload                 # Reload config

# Information
hyprctl version                # Version info
hyprctl systeminfo             # System info
hyprctl monitors               # Monitor info
hyprctl workspaces             # Workspace info
hyprctl clients                # All windows
hyprctl activewindow           # Current window
hyprctl binds                  # All keybinds
hyprctl layers                 # Layer surfaces

# Runtime changes
hyprctl keyword VARIABLE VALUE # Set variable
hyprctl dispatch DISPATCHER [ARGS]  # Run dispatcher
hyprctl setprop WINDOW PROP VALUE   # Set window property
hyprctl switchxkblayout DEVICE next # Switch keyboard layout

# Output formatting
hyprctl -j monitors            # JSON output
hyprctl clients -j | jq '.[] | {class, title}'
```

---

## Autostart

Format in `autostart.conf`:
```bash
exec-once = command            # Run once at startup
exec = command                 # Run on every reload
```

**Recommended order:**
1. Portal/dbus setup
2. Core services (waybar, mako)
3. Background services (hypridle, clipboard)
4. Applications

```bash
# Portal setup (first)
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# Core services
exec-once = waybar
exec-once = mako
exec-once = hyprpaper
exec-once = hypridle

# Clipboard
exec-once = wl-paste --watch cliphist store

# Apps (with delay if needed)
exec-once = sleep 2 && discord --start-minimized
```

---

## Theming Guidelines

### Catppuccin Mocha Colors (from `mocha.conf`)
```
$rosewater, $flamingo, $pink, $mauve, $red, $maroon, $peach,
$yellow, $green, $teal, $sky, $sapphire, $blue, $lavender,
$text, $subtext1, $subtext0,
$overlay2, $overlay1, $overlay0,
$surface2, $surface1, $surface0,
$base, $mantle, $crust
```

### Hyprtoolkit Colors
Format: `0xAARRGGBB` (hex with alpha)
```
colors:background = 0xff1e1e2e
colors:foreground = 0xffcdd6f4
colors:accent = 0xffcba6f7
```

---

## Testing Changes

1. Edit the appropriate config file
2. Run `hyprctl configerrors` to validate
3. Reload config: `hyprctl reload`
4. Test the functionality

## Setup Commands

```bash
# Install dependencies (Arch Linux)
./install_dependencies.sh

# Create symlinks to ~/.config/
./setup.sh
```

## Do Not

- Hardcode application names; use variables from `defaults.conf`
- Skip validation with `hyprctl configerrors`
- Use deprecated window rule syntax (pre-0.53)
- Modify `mocha.conf` colors unless specifically requested
- Create new config files; add to existing modular files instead
- Use `windowrulev2` (deprecated, use `windowrule` with 0.53+ syntax)
- Use old selectors like `class:X` without `match:` prefix in 0.53+

---

## Common Troubleshooting

**Config errors after edit:**
```bash
hyprctl configerrors  # Shows file:line and error
```

**Window class/title unknown:**
```bash
hyprctl activewindow  # Click window first
hyprctl clients -j | jq '.[] | {class, title}'
```

**Keybind not working:**
```bash
hyprctl binds | grep KEY  # Check conflicts
```

**Animation issues:**
```bash
hyprctl keyword animations:enabled false  # Disable temporarily
```

**Screen tearing:**
```bash
# In variables.conf misc section
vrr = 1  # Enable VRR
# Add to window rules for games
windowrule = immediate on, match:class ^(game)$
```

## Official Documentation

- Wiki: https://wiki.hypr.land/
- Variables (0.53): https://wiki.hypr.land/0.53.0/Configuring/Variables/
- Dispatchers: https://wiki.hypr.land/Configuring/Dispatchers/
- Window Rules: https://wiki.hypr.land/Configuring/Window-Rules/
