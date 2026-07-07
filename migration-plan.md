# SDG-FETCH Migration Plan

## 1. Implement Lifecycle Scripts

All four root-level lifecycle scripts are **empty stubs** — must be implemented:

| Script | Purpose |
|--------|---------|
| `install.sh` | Copy `config/SDG-FETCH/` → `~/.config/sdgos/fastfetch/`, copy `local/SDG-FETCH/` scripts to `~/.config/sdgos/fastfetch/`, make executable |
| `uninstall.sh` | Remove `~/.config/sdgos/fastfetch/`, remove `~/.config/fetch.state` |
| `update.sh` | Re-run install steps (overwrite configs, re-generate ASCII art) |
| `detect.sh` | Check if `fastfetch` command exists, verify `~/.config/fetch.state` is valid |

## 2. Path Audit

### 2.1 Script paths reference `~/.config/sdgos/fastfetch/`
All current scripts already use `$HOME/.config/sdgos/fastfetch/` — good. No change needed for the scripts themselves.

### 2.2 Image source and generated output paths
- Source: `config/SDG-FETCH/src/` → deploys to `~/.config/sdgos/fastfetch/src/`
- Generated: `config/SDG-FETCH/gen/` → deploys to `~/.config/sdgos/fastfetch/gen/`
- Configs: `config/SDG-FETCH/conf/` → deploys to `~/.config/sdgos/fastfetch/conf/`

### 2.3 State file location
- `fetch.sh` and `fetch-conf.sh` read/write `~/.config/fetch.state` (top-level dotfile, not under `~/.config/sdgos/`).
- Consider moving to `~/.config/sdgos/fastfetch/fetch.state` for consistency.

## 3. Modular Docs/Tips Contribution

### 3.1 Tips
- SDG-FETCH can contribute tips about fastfetch commands, custom logos, fetch-conf TUI usage.
- Add a `tips/` directory (currently empty) with tip entries.
- Lifecycle scripts should merge these into the global tips system.

### 3.2 Help system
- SDG-FETCH can add help topics about using fetch/fetchconf.
- Add content under `docs/` or contribute to the help topics system via install script.

## 4. Empty Directory Cleanup

| Directory | Status |
|-----------|--------|
| `cache/` | Empty — remove or document purpose |
| `tips/` | Empty — add tips or remove |
| `other/` | Empty — remove or document purpose |

## 5. Pending Issues

### 5.1 `fetch-conf.sh` references `update-files.sh`
- Line 3: `bash -c ~/.config/sdgos/fastfetch/update-files.sh` — this should be a direct call, not wrapped in `bash -c` unnecessarily.
- Change to: `~/.config/sdgos/fastfetch/update-files.sh` or `bash ~/.config/sdgos/fastfetch/update-files.sh`.

### 5.2 Source images tar
- Consider whether 33+ `.png`/`.jpg` files should be in Git or downloaded. They're ~50-200KB each — may bloat the repo.
- If keeping in Git, consider adding `.gitattributes` for LFS.
