# Usage Guide

SDG-FETCH wraps `fastfetch` with a persistent logo and preset picker. Two commands are available after installation.

## Commands

### sdgfetch

Display system information with your currently selected logo and display preset.

```bash
sdgfetch                  # Use current selection from fetch.state
sdgfetch archlinux        # Override logo with distro-specific logo
```

How it works:

1. Reads `~/.config/fetch.state` for the saved `logoName:configName` pair
2. If a distro argument is given, passes it directly to `fastfetch -l` to display that distro's built-in logo
3. Otherwise resolves the logo path from `~/.config/SDG-FETCH/gen/` and the preset from `~/.config/SDG-FETCH/conf/`
4. Runs `fastfetch` with the resolved logo and preset

Logo modes (saved in `fetch.state` via `sdgfetch-conf`):

| Mode | Behavior |
|------|----------|
| `none` | Runs `fastfetch -l none` — no logo, just info |
| `distro` | Runs `fastfetch` without `-l` — uses fastfetch's built-in distro detection |
| `distro-themed` | Same as distro but with ANSI color overrides for a themed look |
| any other value | Loads the ASCII art file from `~/.config/SDG-FETCH/gen/<logoName>` |

### sdgfetch-conf

Interactive logo and preset picker using `fzf`.

```bash
sdgfetch-conf
```

Flow:

1. Automatically runs `update-files.sh` to convert any new source images in `~/.config/SDG-FETCH/src/` to ASCII art
2. Opens an `fzf` picker for logos (with `bat` preview of the ASCII art)
3. Opens an `fzf` picker for presets (with live `fastfetch` preview)
4. Saves the selection as `logoName:configName` to `~/.config/fetch.state`
5. The next `sdgfetch` invocation uses the new selection

## Dependencies

| Dependency | Role |
|------------|------|
| fastfetch | System information display engine |
| jp2a | Image to ASCII art conversion |
| fzf | Interactive picker UI |
| bat | Preview rendering in the logo picker |

## Files

| Path | Purpose |
|------|---------|
| `~/.config/SDG-FETCH/gen/` | ASCII art logo files |
| `~/.config/SDG-FETCH/conf/` | Fastfetch JSONC preset files |
| `~/.config/SDG-FETCH/src/` | Source images for conversion |
| `~/.config/fetch.state` | Persistent selection (`logoName:configName`) |
