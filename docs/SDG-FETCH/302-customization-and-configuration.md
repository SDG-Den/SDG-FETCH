# Customization and Configuration

## Asset Directories

SDG-FETCH uses directories under `~/.local/fetch/`:

| Directory | Purpose |
|-----------|---------|
| `~/.local/fetch/logos/` | ASCII art logo files (organized by category subdirectories) |
| `~/.local/fetch/conf/` | Fastfetch preset JSONC files (organized by category subdirectories) |
| `~/.local/fetch/logos/convert/` | Converted ASCII art from `sdgfetch convert` |

## Adding Custom Logos

Place source images (PNG, JPG, JPEG, WEBP) anywhere, then run `sdgfetch convert`:

```bash
sdgfetch convert mylogo.png
```

The conversion pipeline uses `jp2a`:

```bash
jp2a --height=22 --colors --background=dark input.png > ~/.local/fetch/logos/convert/mylogo
```

The output file in `~/.local/fetch/logos/convert/` has the same base name without extension and appears as `convert/mylogo` in the logo picker.

You can also write ASCII art files directly into any subdirectory of `~/.local/fetch/logos/` — any file in that directory tree appears in the logo picker.

## Modifying Presets

Fastfetch presets are JSONC files in `~/.local/fetch/conf/`. You can edit any existing preset or add your own.

```jsonc
{
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json",
  "display": { ... },
  "modules": [ ... ]
}
```

Add a new preset by placing a `.jsonc` file in `~/.local/fetch/conf/<category>/` — it appears in the preset picker automatically.

## State File

Persistent selection is stored in `~/.config/sdgfetch.state` in the format:

```
logoCategory/logoName:confCategory/configName
```

- `logoCategory/logoName` — path relative to `~/.local/fetch/logos/` (or `none`, `distro`, `distro-themed`)
- `confCategory/configName` — path relative to `~/.local/fetch/conf/` (including `.jsonc` extension)

The file is written by `sdgfetch config` and read by `sdgfetch` on every invocation. If the file is missing or malformed, fastfetch runs with default settings.

## Logo Resolution Logic

The logo selection in `fetch-cli.sh` follows this order:

1. If a distro argument is given, grep-match it against available logos
2. If logo is `none` → `fastfetch -l none`
3. If logo is `distro` → `fastfetch` (no logo argument — auto-detects)
4. If logo is `distro-themed` → `fastfetch` with `--logo-color-*` ANSI overrides
5. Otherwise → `fastfetch -l ~/.local/fetch/logos/<category>/<logoName>`

## Distro Override

Passing a name argument to `sdgfetch` overrides the logo selection using grep matching:

```bash
sdgfetch archlinux
```

| Selected Logo | With Name Arg |
|---------------|---------------|
| `distro-themed` | Runs `fastfetch -l <matched-path>` with ANSI color overrides |
| any other | Runs `fastfetch -l <matched-path>` without color overrides |

## ANSI Color Overrides

When using the `distro-themed` logo mode, SDG-FETCH applies custom ANSI colors. These specific color values are chosen because they are dynamically swapped by **matugen** at the system level to match your current theme colors:

```
--logo-color-1 magenta
--logo-color-2 bright_cyan
--logo-color-3 blue
--logo-color-4 bright_cyan
--logo-color-5 bright_cyan
--logo-color-6 bright_blue
--logo-color-7 bright_magenta
```

To change these colors, edit the values in `~/.local/SDG-FETCH/fetch-cli.sh` under the `distro-themed` case.
