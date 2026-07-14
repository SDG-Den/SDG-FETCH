# Customization and Configuration

## Asset Directories

SDG-FETCH uses three directories under `~/.config/SDG-FETCH/`:

| Directory | Purpose |
|-----------|---------|
| `src/` | Source images (PNG, JPG, WEBP) for conversion to ASCII |
| `gen/` | Generated ASCII art logos and manually written logo files |
| `conf/` | Fastfetch preset JSONC files |

## Adding Custom Logos

Place source images in `~/.config/SDG-FETCH/src/`, then run `sdgfetch-conf` or `update-files.sh` to convert them to ASCII art.

```bash
cp mylogo.png ~/.config/SDG-FETCH/src/
sdgfetch-conf
```

The conversion pipeline uses `jp2a`:

```bash
jp2a --height=22 --colors --background=dark input.png > ~/.config/SDG-FETCH/gen/mylogo
```

Supported source formats: PNG, JPG, JPEG, WEBP. The output file in `gen/` has the same base name without extension.

You can also write ASCII art files directly to `~/.config/SDG-FETCH/gen/` — any file in that directory appears in the logo picker.

## Modifying Presets

Fastfetch presets are JSONC files in `~/.config/SDG-FETCH/conf/`. You can edit any existing preset or add your own.

```jsonc
{
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json",
  "display": { ... },
  "modules": [ ... ]
}
```

Add a new preset by placing a `.jsonc` file in `~/.config/SDG-FETCH/conf/` — it appears in the preset picker automatically.

## State File

Persistent selection is stored in `~/.config/fetch.state` in the format:

```
logoName:configName
```

- `logoName` — filename in `~/.config/SDG-FETCH/gen/` (or `none`, `distro`, `distro-themed`)
- `configName` — filename in `~/.config/SDG-FETCH/conf/` (including `.jsonc` extension)

The file is written by `sdgfetch-conf` and read by `sdgfetch` on every invocation. If the file is missing or malformed, fastfetch runs with default settings.

## Logo Resolution Logic

The logo selection in `fetch.sh` follows this order:

1. If a distro argument is given, use it as the logo (skip state file logic)
2. If logo is `none` → `fastfetch -l none`
3. If logo is `distro` → `fastfetch` (no logo argument — auto-detects)
4. If logo is `distro-themed` → `fastfetch` with `--logo-color-*` ANSI overrides
5. Otherwise → `fastfetch -l ~/.config/SDG-FETCH/gen/<logoName>`

## Distro Override

Passing a distro argument to `sdgfetch` overrides the logo selection:

```bash
sdgfetch archlinux
```

| Selected Logo | With Distro Arg |
|---------------|-----------------|
| `distro-themed` | Runs `fastfetch -l archlinux` with ANSI color overrides |
| any other | Runs `fastfetch -l archlinux` without color overrides |

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

To change these colors, edit the values in `~/.local/SDG-FETCH/fetch.sh` under the `distro-themed` case.
