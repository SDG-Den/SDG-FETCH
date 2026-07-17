# Usage Guide

SDG-FETCH wraps `fastfetch` with a persistent logo and preset picker. The `sdgfetch` command handles both display and configuration.

## Commands

### sdgfetch

Display system information with your currently selected logo and display preset.

```bash
sdgfetch                  # Use current selection from sdgfetch.state
sdgfetch archlinux        # Override logo (grep matches "archlinux" in logo list)
```

Logo modes (saved in `sdgfetch.state` via the `config` subcommand):

| Mode | Behavior |
|------|----------|
| `none` | Runs `fastfetch -l none` — no logo, just info |
| `distro` | Runs `fastfetch` without `-l` — uses fastfetch's built-in distro detection |
| `distro-themed` | Same as distro but with themed ANSI color overrides |
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

## How logo resolution works

The `sdgfetch` command resolves the logo in this order:

1. If a name argument is given (e.g. `sdgfetch archlinux`), grep-match it against available logos and use that
2. If the saved logo is `none` → `fastfetch -l none`
3. If the saved logo is `distro` → `fastfetch` with no logo argument (auto-detects)
4. If the saved logo is `distro-themed` → `fastfetch` with themed ANSI color overrides
5. Otherwise → `fastfetch -l ~/.local/fetch/logos/<category>/<logoName>`

## State file

Persistent selection is stored in `~/.config/sdgfetch.state`:

```
logoCategory/logoName:confCategory/configName
```

- `logoCategory/logoName` — path relative to `~/.local/fetch/logos/` (or `none`, `distro`, `distro-themed`)
- `confCategory/configName` — path relative to `~/.local/fetch/conf/` (includes `.jsonc` extension)

The file is written by `sdgfetch config` and read by `sdgfetch` on every invocation. If the file is missing or malformed, fastfetch runs with default settings.

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
