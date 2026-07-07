# SDG-FETCH Migration Plan

## Directory Mapping

| Source | Installed to |
|--------|-------------|
| `config/SDG-FETCH/conf/` | `~/.config/SDG-FETCH/conf/` |
| `config/SDG-FETCH/src/` | `~/.config/SDG-FETCH/src/` |
| `config/SDG-FETCH/gen/` | `~/.local/SDG-FETCH/gen/` (generated, writable) |
| `local/SDG-FETCH/fetch.sh` | `~/.local/SDG-FETCH/fetch.sh` |
| `local/SDG-FETCH/fetch-conf.sh` | `~/.local/SDG-FETCH/fetch-conf.sh` |
| `local/SDG-FETCH/update-files.sh` | `~/.local/SDG-FETCH/update-files.sh` |
| `tips/` | `~/.local/tips/SDG-FETCH/` |
| `docs/` | `~/.local/docs/SDG-FETCH/` |

## Path Rewrites

### fetch.sh (internal paths)
```
SRC_DIR="$HOME/.config/sdgos/fastfetch/gen"    → SRC_DIR="$HOME/.local/SDG-FETCH/gen"
CONF_DIR="$HOME/.config/sdgos/fastfetch/conf"  → CONF_DIR="$HOME/.config/SDG-FETCH/conf"
```

### fetch-conf.sh (internal + cross)
```
bash -c ~/.config/sdgos/fastfetch/update-files.sh   → ~/.local/SDG-FETCH/update-files.sh
SRC_DIR="$HOME/.config/sdgos/fastfetch/gen"          → SRC_DIR="$HOME/.local/SDG-FETCH/gen"
CONF_DIR="$HOME/.config/sdgos/fastfetch/conf"        → CONF_DIR="$HOME/.config/SDG-FETCH/conf"
bat ~/.config/sdgos/fastfetch/gen/{}                 → bat $HOME/.local/SDG-FETCH/gen/{}
fastfetch ... -c ~/.config/sdgos/fastfetch/conf/{}   → fastfetch ... -c $HOME/.config/SDG-FETCH/conf/{}
~/.config/fetch.state                                 → ~/.config/SDG-FETCH/fetch.state
```

### update-files.sh (internal)
```
SRC_DIR="$HOME/.config/sdgos/fastfetch/src"   → SRC_DIR="$HOME/.config/SDG-FETCH/src"
OUT_DIR="$HOME/.config/sdgos/fastfetch/gen"    → OUT_DIR="$HOME/.local/SDG-FETCH/gen"
```

## Lifecycle Scripts

All four root-level scripts are empty. Implement:

- **install.sh**: Copy config, local, docs, tips dirs to respective `~/.config/SDG-FETCH/`, `~/.local/SDG-FETCH/`, `~/.local/docs/SDG-FETCH/`, `~/.local/tips/SDG-FETCH/`. Run `update-files.sh` to generate ASCII art. Make scripts executable.
- **uninstall.sh**: Remove all SDG-FETCH dirs from `~/.config/`, `~/.local/`, `~/.local/tips/`, `~/.local/docs/`. Remove `~/.config/SDG-FETCH/fetch.state`.
- **update.sh**: Re-run install steps.
- **detect.sh**: Check `fastfetch`, `jp2a`, `fzf`, `bat`.

## Modular Tips

- Create `tips/` with entries about fastfetch usage, fetchconf TUI, logo switching
- `install.sh` copies to `~/.local/tips/SDG-FETCH/`

## Modular Docs

- `docs/SDG-FETCH/README.md` already exists — `install.sh` copies to `~/.local/docs/SDG-FETCH/`

## Empty Dir Cleanup

| Dir | Action |
|-----|--------|
| `tips/` | Populate or remove |
| `other/` | Remove |
| `cache/` | Remove |
