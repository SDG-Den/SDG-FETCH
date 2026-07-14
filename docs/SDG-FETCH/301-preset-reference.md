# Preset Reference

Fastfetch presets are JSONC configuration files placed in `~/.config/SDG-FETCH/conf/`. SDG-FETCH ships with presets covering a range of display styles.

The preset directory is the standard location for fastfetch configs. You can add your own `.jsonc` files — they appear in the `sdgfetch-conf` picker automatically.

## Preset Categories

### Clone Presets
`neofetch.jsonc`, `screenfetch.jsonc`, `paleofetch.jsonc`, `archey.jsonc` — Mimic the layout of classic system info tools.

### Minimal Layouts
`minimal.jsonc`, `minimal-colors.jsonc`, `minimal-asciibars.jsonc`, `simple.jsonc`, `simple-dots.jsonc`, `simple-hack.jsonc`, `simple-icons.jsonc`, `simple-leftbar.jsonc`, `smol-bars.jsonc` — Clean, compact displays with minimal decoration.

### Framed Layouts
`left-frame-1.jsonc`, `left-frame-2.jsonc`, `left-frame-dotted.jsonc`, `multi-frame.jsonc`, `multi-frame-1.jsonc`, `split-frame.jsonc`, `wide-frame-1.jsonc`, `wide-frame-thicc.jsonc`, `framed-dots.jsonc` — Boxed and bordered layouts with various frame styles.

### Tree & Group Layouts
`tree.jsonc`, `tree-colors.jsonc`, `grouped.jsonc`, `groups.jsonc` — Hierarchical or grouped module arrangements.

### Themed Presets
`theme.jsonc`, `EVA.jsonc`, `hypr.jsonc`, `nyarch.jsonc`, `arch.jsonc`, `arch-table.jsonc`, `deckers.jsonc` — Presets with specific visual themes or color schemes.

### Comprehensive Layouts
`all.jsonc`, `full-info.jsonc`, `long-info.jsonc`, `machine-report.jsonc` — Show extensive system information across many modules.

### Special Purpose
`ascii-art.jsonc`, `ci.jsonc`, `date-time.jsonc`, `plaintext.jsonc`, `renderer.jsonc`, `default.jsonc`, `os.jsonc`, `fancy.jsonc`, `very-fancy.jsonc`, `very-fancy-2.jsonc` — Specialized layouts for specific use cases or display preferences.

## Custom Presets

To add a custom preset, place a `.jsonc` file in `~/.config/SDG-FETCH/conf/`. The file must follow fastfetch's JSON schema format. It will appear in the `sdgfetch-conf` preset picker automatically.
