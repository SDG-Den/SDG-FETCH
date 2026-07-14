# Customization

## Adding custom logos

Place PNG or JPG images in `~/.config/SDG-FETCH/src/`, then run `sdgfetch-conf`. It automatically converts new images to ASCII art and makes them available in the logo picker.

## Adding custom presets

Place fastfetch JSONC configuration files in `~/.config/SDG-FETCH/conf/`. They appear in the preset picker automatically.

## Where files live

| Path | Purpose |
|------|---------|
| `~/.config/SDG-FETCH/gen/` | ASCII art logo files |
| `~/.config/SDG-FETCH/conf/` | Display preset configurations |
| `~/.config/SDG-FETCH/src/` | Source images for conversion |
| `~/.config/fetch.state` | Your current logo and preset selection |
