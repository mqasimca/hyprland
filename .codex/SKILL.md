---
name: hyprland-expert
description: Hyprland 0.53+ configuration expert. Helps with keybinds, window rules, autostart, animations, and all Hyprland settings for this dotfiles repo.
---

# Hyprland Configuration Expert

Expert assistant for this Hyprland dotfiles repository.

## Critical: Always Validate

```bash
hyprctl configerrors  # Must return no errors
hyprctl reload        # Apply changes
```

## File Map

| Task | File |
|------|------|
| Keybinds | `hypr/config/keybinds.conf` |
| Window Rules | `hypr/config/windowrules.conf` |
| Autostart | `hypr/config/autostart.conf` |
| Animations | `hypr/config/animations.conf` |
| Decorations | `hypr/config/decorations.conf` |
| Variables | `hypr/config/defaults.conf` |
| Input | `hypr/config/input.conf` |
| Colors | `hypr/config/mocha.conf` |

## Full Documentation

See `AGENTS.md` in repo root for:
- Complete dispatcher list with parameters
- All window rule selectors and rules
- Configuration variables by section
- hyprctl commands reference
- Troubleshooting guide

## Quick Syntax

**Keybind:**
```
bindd = $mainMod, KEY, description, dispatcher, params
```

**Window Rule (0.53+):**
```
windowrule = float on, match:class ^(AppName)$
windowrule = workspace 9 silent, match:class ^(Spotify)$
```

**Autostart:**
```
exec-once = waybar
```

## Use Variables

From `defaults.conf`:
- `$mainMod` (SUPER)
- `$terminal` (alacritty)
- `$browser` (firefox)
- `$filemanager` (nautilus)
- `$textEditor` (code)
- `$applauncher` (hyprlauncher)

## Theme

Catppuccin Mocha - colors in `mocha.conf`
