# SDG-FETCH

System information fetch utility with ASCII art logos and fastfetch presets.

## Description

SDG-FETCH wraps `fastfetch` with an interactive logo and preset picker. It provides 45 ASCII art logos (distros, brands, pride flags, culture) and 49 display presets (neofetch/screenfetch clones, framed boxes, tree layouts, themed). Selections persist to `~/.config/fetch.state`.

## Features

- **45 ASCII logos** — distros (arch, nyarch, cachy), gaming brands (ROG, Alienware, MSI), laptop brands (ThinkPad, Dell, HP), meme/culture, pride flags
- **49 fastfetch presets** — neofetch/screenfetch/paleofetch clones, minimal, framed, tree, themed, comprehensive
- **Persistent state** — logo and preset saved to `~/.config/fetch.state`
- **Auto-conversion** — place PNG/JPG in `src/`, run `sdgfetch-conf` to convert via `jp2a`
- **Distro override** — `sdgfetch archlinux` for themed display

## CLI Usage

```bash
sdgfetch                  # Display with current selection
sdgfetch archlinux        # Use distro-themed logo + preset
sdgfetch-conf             # Interactive logo + preset picker
```

## Installation

```bash
sdgpkg install sdg-fetch
```

## Dependencies

- `fastfetch` — system information display engine
- `jp2a` — image to ASCII art conversion
- `fzf` — interactive picker UI
- `bat` — preview rendering

## Related Packages

- **SDG-TERM** — runs `sdgfetch` on every terminal startup
