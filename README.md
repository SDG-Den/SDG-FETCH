# SDG-FETCH

System information fetch utility with ASCII art logos and fastfetch presets.

## Description

SDG-FETCH wraps `fastfetch` with an interactive logo and preset picker. It provides a library of ASCII art logos (distros, brands, pride flags, culture) and many display presets (neofetch/screenfetch clones, framed boxes, tree layouts, themed). Selections persist to `~/.config/fetch.state`.

## Features

- **ASCII logos** — distros (arch, nyarch, cachy), gaming brands (ROG, Alienware, MSI), laptop brands (ThinkPad, Dell, HP), meme/culture, pride flags
- **Fastfetch presets** — neofetch/screenfetch/paleofetch clones, minimal, framed, tree, themed, comprehensive
- **Persistent state** — logo and preset saved to `~/.config/fetch.state`
- **Auto-conversion** — place PNG/JPG in `src/`, run `sdgfetch-conf` to convert via `jp2a`
- **Distro override** — `sdgfetch archlinux` for themed display

## Documentation

Full docs deployed to `~/.local/docs/SDG-FETCH/`:

| Doc | Description |
|-----|-------------|
| [Usage Guide](docs/SDG-FETCH/201-usage-guide.md) | CLI reference, logo modes, dependencies |
| [Logo Library](docs/SDG-FETCH/202-logo-library.md) | All 45 logos categorized |
| [Preset Reference](docs/SDG-FETCH/301-preset-reference.md) | 49 display presets by category |
| [Customization](docs/SDG-FETCH/302-customization-and-configuration.md) | Adding logos, editing presets, ANSI colors |
| [Integration](docs/SDG-FETCH/501-integration.md) | Terminal startup, cross-package usage |

## Tips

Quick tips in `~/.local/tips/SDG-FETCH/tips.list` covering common workflows: running `sdgfetch`, using the configurator, adding custom logos, and more.

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
- **SDG-DOCS** — indexes and serves documentation
