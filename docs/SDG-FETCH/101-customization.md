# Customization

## Adding custom logos

Place source images (PNG, JPG, JPEG, WEBP) in any directory and convert via sdgfetch:

```bash
sdgfetch convert mylogo.png
```

The converted ASCII art is placed in `~/.local/fetch/logos/convert/` and appears in the logo picker as `convert/mylogo`.

You can also write ASCII art files directly into `~/.local/fetch/logos/<category>/` — any file in any subdirectory of `~/.local/fetch/logos/` appears in the logo picker.

## Adding custom presets

Place fastfetch JSONC configuration files in `~/.local/fetch/conf/<category>/`. They appear in the preset picker automatically.

## Where files live

| Path | Purpose |
|------|---------|
| `~/.local/fetch/logos/` | ASCII art logo files (organized by category subdirectories) |
| `~/.local/fetch/conf/` | Display preset configurations (organized by category subdirectories) |
| `~/.config/sdgfetch.state` | Your current logo and preset selection |
