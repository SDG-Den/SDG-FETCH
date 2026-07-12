# Configuration

## State File

Persistent selection is stored in `~/.config/fetch.state` in the format:

```
logoName:configName
```

Example:

```
thinkpad:neofetch.jsonc
```

- `logoName` — filename in `~/.config/SDG-FETCH/gen/` (or one of `none`, `distro`, `distro-themed`)
- `configName` — filename in `~/.config/SDG-FETCH/conf/` (including `.jsonc` extension)

The file is written by `sdgfetch-conf` and read by `sdgfetch` on every invocation. If the file is missing or malformed, fastfetch runs with its default settings.

## Distro Override

Passing a distro argument to `sdgfetch` overrides the logo selection:

```bash
sdgfetch archlinux
```

The behavior depends on the currently selected logo mode:

| Selected Logo | With Distro Arg |
|---------------|-----------------|
| `distro-themed` | Runs `fastfetch -l archlinux` with ANSI color overrides |
| any other | Runs `fastfetch -l archlinux` without color overrides |

The distro argument is passed directly to fastfetch's `-l` flag, which uses fastfetch's built-in distro logo database.

## Logo Resolution Logic

The logo selection in `fetch.sh` follows this order:

1. If a distro argument is given, use it as the logo (skip state file logic)
2. If logo is `none` → `fastfetch -l none`
3. If logo is `distro` → `fastfetch` (no logo argument — auto-detects)
4. If logo is `distro-themed` → `fastfetch` with `--logo-color-*` ANSI overrides
5. Otherwise → `fastfetch -l ~/.config/SDG-FETCH/gen/<logoName>`
