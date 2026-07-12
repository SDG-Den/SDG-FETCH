# Customization

## Adding Custom Logos

Place source images in `~/.config/SDG-FETCH/src/`, then run `sdgfetch-conf` or `update-files.sh` to convert them to ASCII art.

```bash
# Place your image
cp mylogo.png ~/.config/SDG-FETCH/src/

# Convert — either:
sdgfetch-conf          # Auto-converts before opening the picker
# or manually:
~/.local/SDG-FETCH/update-files.sh
```

The conversion pipeline uses `jp2a`:

```bash
jp2a --height=22 --colors --background=dark input.png > ~/.config/SDG-FETCH/gen/mylogo
```

Supported source formats: PNG, JPG, JPEG, WEBP. The output file in `gen/` has the same base name without extension.

You can also write ASCII art files directly to `~/.config/SDG-FETCH/gen/` — any file in that directory appears in the logo picker.

## Modifying Presets

Fastfetch presets are JSONC files in `~/.config/SDG-FETCH/conf/`. You can edit any existing preset or add your own.

Each preset follows fastfetch's JSON schema with `display` settings and `modules`:

```jsonc
{
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/master/doc/json_schema.json",
  "display": { ... },
  "modules": [ ... ]
}
```

Add a new preset by placing a `.jsonc` file in `~/.config/SDG-FETCH/conf/` — it appears in the preset picker automatically.

## ANSI Color Overrides

When using the `distro-themed` logo mode, SDG-FETCH applies custom ANSI colors to fastfetch's built-in distro logo:

```
--logo-color-1 magenta
--logo-color-2 bright_cyan
--logo-color-3 blue
--logo-color-4 bright_cyan
--logo-color-5 bright_cyan
--logo-color-6 bright_blue
--logo-color-7 bright_magenta
```

To change these colors, edit the color values in `~/.local/SDG-FETCH/fetch.sh` under the `distro-themed` case.
