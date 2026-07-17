# Usage Guide

SDG-FETCH wraps `fastfetch` with a persistent logo and preset picker. The `sdgfetch` command handles both display and configuration.

## Commands

### sdgfetch

Display system information with your currently selected logo and display preset.

```bash
sdgfetch                  # Use current selection from sdgfetch.state
sdgfetch archlinux        # Override logo (grep matches "archlinux" in logo list)
```

How it works:

1. Reads `~/.config/sdgfetch.state` for the saved `logoCategory/logoName:confCategory/configName` pair
2. If a distro/logo argument is given, grep-matches against available logos
3. Resolves the logo path from `~/.local/fetch/logos/` and the preset from `~/.local/fetch/conf/`
4. Runs `fastfetch` with the resolved logo and preset

Logo modes (saved in `sdgfetch.state` via the `config` subcommand):

| Mode | Behavior |
|------|----------|
| `none` | Runs `fastfetch -l none` — no logo, just info |
| `distro` | Runs `fastfetch` without `-l` — uses fastfetch's built-in distro detection |
| `distro-themed` | Same as distro but with ANSI color overrides for a themed look |
| any other value | Loads the ASCII art file from `~/.local/fetch/logos/<category>/<logoName>` |

### sdgfetch config

Interactive logo and preset picker using `fzf`.

```bash
sdgfetch config
```

Flow:

1. Opens an `fzf` picker for logos (with `bat` preview of the ASCII art)
2. Opens an `fzf` picker for presets (with live `fastfetch` preview)
3. Saves the selection as `logoCategory/logoName:confCategory/configName` to `~/.config/sdgfetch.state`
4. The next `sdgfetch` invocation uses the new selection

### Other subcommands

```bash
sdgfetch listlogo              # List all available logos
sdgfetch listconf              # List all available configs
sdgfetch setlogo <name>        # Set logo by grep matching
sdgfetch setconf <name>        # Set config by grep matching
sdgfetch convert <imagefile>   # Convert image to ASCII art via jp2a
sdgfetch help                  # Show help text
```

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
| `~/.local/fetch/logos/` | ASCII art logo files (organized by category subdirectories) |
| `~/.local/fetch/conf/` | Fastfetch JSONC preset files (organized by category subdirectories) |
| `~/.config/sdgfetch.state` | Persistent selection (`logoCategory/logoName:confCategory/configName`) |
| `~/.local/SDG-FETCH/fetch-cli.sh` | Main CLI script |
