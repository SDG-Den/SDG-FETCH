# Getting Started

SDG-FETCH displays your system information (OS, kernel, CPU, GPU, memory, and more) together with a decorative ASCII art logo. It wraps `fastfetch` with an interactive logo and preset picker. Selections persist between sessions.

## Installation

```sh
sdgpkg install sdg-fetch
```

This installs the `sdgfetch` command, copies logo files and presets, and places documentation and tips on your system. SDG-FETCH is also installed automatically as part of SDG-TERM.

## Quick Start

Show your system info with the currently selected logo and preset:

```sh
sdgfetch
```

Pick a different logo or display style interactively:

```sh
sdgfetch config
```

This opens an `fzf` picker for logos (with `bat` preview), then a picker for presets (with live `fastfetch` preview). Your selection is saved to `~/.config/sdgfetch.state`.

Show a specific logo by name:

```sh
sdgfetch archlinux
```

The name is grep-matched against available logos. Any name works — distro, brand, or custom.
