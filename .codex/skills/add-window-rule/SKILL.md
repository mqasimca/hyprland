---
name: add-window-rule
description: Add a window rule to control how specific applications behave. Use when the user wants to float, resize, position, or assign windows to workspaces.
---

# Add Window Rule Skill

Create window rules for specific applications in Hyprland.

## Instructions

1. **Get the window class/title**:
   ```bash
   hyprctl clients
   ```
   Or interactively click a window:
   ```bash
   hyprctl activewindow
   ```

2. **Read existing rules**:
   ```bash
   cat hypr/config/windowrules.conf
   ```

3. **Add the rule** using 0.53+ syntax:
   ```
   windowrule = RULE, SELECTOR
   ```

4. **Validate**:
   ```bash
   hyprctl configerrors
   ```

5. **Reload**:
   ```bash
   hyprctl reload
   ```

## Selector Types (0.53+ Syntax)

```bash
class:ClassName        # Match by window class
title:WindowTitle      # Match by title (regex supported)
initialClass:...       # Match initial class
initialTitle:...       # Match initial title
floating:1             # Match floating windows
fullscreen:1           # Match fullscreen windows
workspace:N            # Match windows on workspace N
```

## Common Rules

```bash
# Floating
windowrule = float, class:pavucontrol
windowrule = float, title:^(Open File)$

# Workspace assignment
windowrule = workspace 9 silent, class:Spotify
windowrule = workspace 10, class:discord

# Opacity (active, inactive)
windowrule = opacity 0.95 0.85, class:Code
windowrule = opacity 0.9 0.8, class:Alacritty

# Size and position
windowrule = size 800 600, class:mpv
windowrule = center, class:mpv
windowrule = move 100 100, class:calculator

# Pin to all workspaces
windowrule = pin, title:Picture-in-Picture

# Fullscreen
windowrule = fullscreen, class:^(steam_app_.*)$

# No blur/dim
windowrule = noblur, class:firefox
windowrule = nodim, class:mpv

# Layer rules
windowrule = stayfocused, class:rofi
windowrule = dimaround, class:rofi

# Animation override
windowrule = animation slide, class:rofi
windowrule = animation popin, class:pavucontrol

# Workspace rules
windowrule = workspace special:scratchpad, class:Spotify

# Suppress maximize
windowrule = suppressevent maximize, class:.*
```

## Regex Patterns

Title selectors support regex:
```bash
windowrule = float, title:^(Save As)(.*)$
windowrule = float, title:.*[Pp]review.*
```

## Finding Window Info

To find the correct class/title for a window:

```bash
# List all windows
hyprctl clients -j | jq '.[] | {class, title}'

# Watch for new windows
hyprctl clients -j | jq -r '.[] | "\(.class) - \(.title)"'

# Get active window info
hyprctl activewindow
```

## Layer Rules (for special windows)

```bash
layerrule = blur, waybar
layerrule = ignorezero, waybar
layerrule = blur, rofi
```

## Workspace Rules

In `hypr/config/workspaces.conf`:
```bash
workspace = 1, monitor:DP-1, default:true
workspace = special:scratchpad, on-created-empty:alacritty
```
