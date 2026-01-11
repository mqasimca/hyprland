---
name: validate-config
description: Validate Hyprland configuration for errors. Use after making any config changes or when debugging issues.
---

# Validate Configuration Skill

Validate Hyprland configuration and fix any errors.

## Instructions

1. **Check for configuration errors**:
   ```bash
   hyprctl configerrors
   ```

2. **If errors are found**, the output will show:
   - File path
   - Line number
   - Error description

3. **Fix the errors** in the indicated files

4. **Re-validate** until no errors remain

5. **Reload configuration**:
   ```bash
   hyprctl reload
   ```

## Common Error Types

### Syntax Errors

**Missing comma or value**:
```
# Wrong
bind = $mainMod Return, exec, $terminal

# Correct
bind = $mainMod, Return, exec, $terminal
```

**Invalid dispatcher**:
```
# Wrong
bind = $mainMod, Q, close

# Correct
bind = $mainMod, Q, killactive
```

### Window Rule Errors (0.53+)

**Old syntax (deprecated)**:
```
# Wrong (pre-0.53)
windowrulev2 = float, class:^(pavucontrol)$

# Correct (0.53+)
windowrule = float, class:pavucontrol
```

### Variable Errors

**Undefined variable**:
```
# Wrong (if $myVar not defined)
bind = $myVar, Q, killactive

# Fix: Define in defaults.conf or use existing variable
$myVar = SUPER
```

### Invalid Values

**Invalid color format**:
```
# Wrong
col.active_border = rgb(ff0000)

# Correct
col.active_border = rgba(cba6f7ee)
```

**Invalid boolean**:
```
# Wrong
enabled = yes

# Correct
enabled = true
```

## Diagnostic Commands

```bash
# Check config errors
hyprctl configerrors

# Check Hyprland version
hyprctl version

# View current config values
hyprctl getoption general:border_size

# List all options
hyprctl -j getoption | jq

# Check active window (for rule testing)
hyprctl activewindow

# List all clients
hyprctl clients

# View monitors
hyprctl monitors

# Check binds
hyprctl binds
```

## Quick Fixes

### Reload After Fix
```bash
hyprctl reload
```

### Check Specific File Syntax
```bash
# Test parse a specific config
hyprctl keyword source /path/to/config.conf
```

### Reset to Defaults
If config is broken, temporarily:
```bash
# Rename broken config
mv ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.bak

# Hyprland will use defaults
# Then restore and fix
```

## Validation Checklist

- [ ] `hyprctl configerrors` returns empty
- [ ] All sourced files exist
- [ ] Variables used are defined in `defaults.conf`
- [ ] Window rules use 0.53+ syntax
- [ ] Colors use correct format (rgba/rgb)
- [ ] Booleans use true/false
- [ ] Scripts are executable
