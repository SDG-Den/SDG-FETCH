# SDG-FETCH Analysis

## Type
System Info / Utility Module

## Description
SDG-FETCH is a wrapper and configuration system around `fastfetch`. It provides an interactive logo picker (45 ASCII art logos) and style picker (49 display presets) with persistent state saved to `~/.config/fetch.state`.

## CLI Entry Points
- `/usr/bin/sdgfetch` — Display system info with selected logo + preset
- `/usr/bin/sdgfetch-conf` — Interactive configurator (fzf-based logo + preset picker)

## Usage
After installation, two commands become available:

### sdgfetch
Run `sdgfetch` to display system information with your currently selected logo and preset. Pass an optional distro argument for themed logos:
```bash
sdgfetch              # Current selection
sdgfetch archlinux    # Use arch logo with themed config
```

### sdgfetch-conf
Run `sdgfetch-conf` to interactively pick a logo and display preset:
```bash
sdgfetch-conf         # Opens fzf pickers for logo then preset
```

This writes your selection as `logoName:configName` to `~/.config/fetch.state`. The next `sdgfetch` invocation uses the new selection. To add new logos, place source images in `~/.config/SDG-FETCH/src/` and run `sdgfetch-conf` — it will automatically convert them via `jp2a`.

## Directory Structure
```
SDG-FETCH/
├── install.sh
├── uninstall.sh
├── update.sh
├── local/SDG-FETCH/
│   ├── fetch.sh                  # Main entry point
│   ├── fetch-conf.sh             # Configurator TUI
│   └── update-files.sh           # Image-to-ASCII converter (jp2a)
├── config/SDG-FETCH/
│   ├── gen/                      # 45 ASCII art logos
│   ├── src/                      # 31 source images (PNG/JPG)
│   └── conf/                     # 49 fastfetch JSONC presets
├── docs/SDG-FETCH/README.md      # Quick reference (22 lines)
└── tips/SDG-FETCH/             # Tips directory (tips.list)
```

## Features
- **45 ASCII logos** in `gen/`: Distros (arch, nyarch, cachy), gaming brands (ROG, Alienware, MSI), laptop brands (ThinkPad, Dell, HP), meme/culture, pride flags, Windows tributes (31 source images in `src/` converted via `jp2a`)
- **49 fastfetch presets** in `conf/`: neofetch/screenfetch/paleofetch clones, minimal layouts, framed boxes, tree/group layouts, themed, comprehensive
- **State persistence**: `logoName:configName` saved to `~/.config/fetch.state`
- **Image-to-ASCII pipeline**: `jp2a` converts source images to 22-line colored ANSI art
- **Theme coloring**: Distro-themed logos with configurable ANSI color overrides

## Required Dependencies
| Dependency | Purpose |
|------------|---------|
| fastfetch | System information display engine |
| jp2a | Image to ASCII conversion |
| fzf | Interactive picker UI |
| bat | Preview rendering |

## Optional Dependencies
None

## Required Dependents
- **SDG-TERM**: Runs `sdgfetch` in Ghostty `initial-command` on every terminal startup

## Optional Dependents
- **SDG-DOCS**: Documents SDG-FETCH in docs
