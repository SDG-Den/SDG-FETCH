# SDG-FETCH

System information fetch utility with ASCII art logos and fastfetch presets.

## Description

SDG-FETCH wraps `fastfetch` with an interactive logo and preset picker. It provides a library of ASCII art logos (distros, brands, pride flags, culture) and many display presets (neofetch/screenfetch clones, framed boxes, tree layouts, themed). Selections persist to `~/.config/sdgfetch.state`.

## Features

- **ASCII logos** — 42 logos across distros, gaming brands, laptop brands, tech culture, memes, pride, themes, and Windows tributes
- **Fastfetch presets** — 49 presets: neofetch/screenfetch/paleofetch clones, minimal, framed, tree, themed, comprehensive
- **Persistent state** — logo and preset saved to `~/.config/sdgfetch.state`
- **Image conversion** — `sdgfetch convert <image>` converts via `jp2a`
- **Distro override** — `sdgfetch archlinux` selects a matching logo

## Documentation

Full docs deployed to `~/.local/docs/SDG-FETCH/`:

| Doc | Description |
|-----|-------------|
| [Usage Guide](docs/SDG-FETCH/201-usage-guide.md) | CLI reference, logo modes, dependencies |
| [Logo Library](docs/SDG-FETCH/202-logo-library.md) | All logos categorized |
| [Preset Reference](docs/SDG-FETCH/301-preset-reference.md) | All display presets by category |
| [Customization](docs/SDG-FETCH/302-customization-and-configuration.md) | Adding logos, editing presets, ANSI colors |
| [Integration](docs/SDG-FETCH/501-integration.md) | Terminal startup, cross-package usage |

## Tips

Quick tips in `~/.local/tips/SDG-FETCH/tips.list` covering common workflows: running `sdgfetch`, using the configurator, adding custom logos, and more.

## CLI Usage

```bash
sdgfetch                  # Display with current selection
sdgfetch archlinux        # Use matching logo
sdgfetch config           # Interactive logo + preset picker
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
