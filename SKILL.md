---
name: hyprland-config
description: Expert assistant for Hyprland window manager configuration. Use when modifying keybinds, window rules, autostart, animations, decorations, or any Hyprland config files.
---

# Hyprland Configuration Expert

You are an expert in Hyprland 0.53+ configuration for this dotfiles repository.

## Quick Reference

- **Config Location**: `hypr/config/` (modular files)
- **Main Config**: `hypr/hyprland.conf` (sources all modules)
- **Validation**: Always run `hyprctl configerrors` after changes
- **Reload**: `hyprctl reload`

## Key Files

| Task | Edit This File |
|------|----------------|
| Keybinds | `hypr/config/keybinds.conf` |
| Window Rules | `hypr/config/windowrules.conf` |
| Autostart | `hypr/config/autostart.conf` |
| Variables | `hypr/config/defaults.conf` |
| Animations | `hypr/config/animations.conf` |
| Decorations | `hypr/config/decorations.conf` |
| Input | `hypr/config/input.conf` |
| Monitors | `hypr/config/monitors.conf` |

## Documentation References

For complete Hyprland expertise, read these files in order:

1. **AGENTS.md** - Complete dispatcher reference, window rule syntax, configuration variables
2. **hypr/config/keybinds.conf** - Existing keybind examples
3. **hypr/config/windowrules.conf** - Window rule examples (0.53+ syntax)

## Syntax Quick Reference

### Keybinds
```
bind = $mainMod, KEY, dispatcher, params
bindd = $mainMod, KEY, description, dispatcher, params
```

Flags: `e` (repeat), `l` (locked), `m` (mouse), `r` (release), `n` (no consume)

### Window Rules (0.53+)
```
windowrule = RULE, match:class ^(regex)$
windowrule = RULE, match:title ^(regex)$
```

### Autostart
```
exec-once = command
```

## Variables (use these, don't hardcode)

- `$mainMod` = SUPER
- `$terminal` = alacritty
- `$browser` = firefox
- `$filemanager` = nautilus
- `$textEditor` = code
- `$applauncher` = hyprlauncher

## Workflow

1. Read the target config file first
2. Make changes following existing patterns
3. Run `hyprctl configerrors`
4. Fix any errors before proceeding
5. Test with `hyprctl reload`

## Common Dispatchers

- `exec` - Run command
- `killactive` - Close window
- `togglefloating` - Float/tile
- `workspace N` - Switch workspace
- `movetoworkspace N` - Move window
- `fullscreen 0|1|2` - Fullscreen modes
- `togglespecialworkspace name` - Scratchpad
- `pin` - Pin to all workspaces

## Common Window Rules

- `float on` - Make floating
- `workspace N silent` - Assign workspace
- `opacity X Y` - Set opacity
- `size X Y` - Set size
- `center 1` - Center window
- `no_blur on` - Disable blur
- `immediate on` - Enable tearing (games)

## Theme

Catppuccin Mocha - use color variables from `hypr/config/mocha.conf`:
`$mauve`, `$blue`, `$green`, `$red`, `$text`, `$base`, `$surface0`, etc.
