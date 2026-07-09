# SDG-FETCH Analysis

## Function

SDG-FETCH is a fastfetch wrapper that provides ASCII-art logo display and configurable system info output. It consists of three scripts:

| Script | Path | Purpose |
|--------|------|---------|
| `fetch.sh` | `local/SDG-FETCH/fetch.sh` | Runs fastfetch with a selected logo and config preset; supports optional distro argument |
| `fetch-conf.sh` | `local/SDG-FETCH/fetch-conf.sh` | TUI configurator (fzf-based) for picking logo ASCII art and display style |
| `update-files.sh` | `local/SDG-FETCH/update-files.sh` | Converts source images → ASCII art via jp2a |

**State file**: `~/.config/fetch.state` — stores `$LOGO:$CONF` pair written by `fetch-conf.sh` and read by `fetch.sh`.

**Config**: 49 fastfetch `.jsonc` presets in `config/SDG-FETCH/conf/`.

**Source images**: 33 `.png`/`.jpg`/`.webp` images in `config/SDG-FETCH/src/`, converted to ASCII in `config/SDG-FETCH/gen/` (45 generated files).

---

## Dependencies

Listed in `install.sh:4-7`:

| Dependency | Install command | Purpose |
|------------|-----------------|---------|
| `jp2a` | `unipkg install any jp2a` | Image → ASCII conversion (`update-files.sh:23`) |
| `fastfetch` | `unipkg install any fastfetch` | System info display (all scripts) |
| `fzf` | `unipkg install any fzf` | TUI file selector (`fetch-conf.sh:8-10`) |
| `bat` | `unipkg install any bat` | Preview rendered ASCII in fzf (`fetch-conf.sh:8`) |

Installed system-wide symlinks at `/usr/bin/sdgfetch` and `/usr/bin/sdgfetch-conf` pointing to `~/.local/SDG-FETCH/`.

---

## Dependents (cross-repo references)

### SDG-OS-META/install.sh
- **Line 5**: `sdgpkg install sdg-fetch` — this repo is a required package in the meta-installer.

### SDG-TERM/migration-plan.md
- **Line 20**: `~/.config/sdgos/fastfetch/fetch.sh` → `~/.local/SDG-FETCH/fetch.sh`
- **Line 29-30**: zshconfig.zsh aliases reference `~/.local/SDG-FETCH/fetch.sh` and `~/.local/SDG-FETCH/fetch-conf.sh`

### SDG-DOCS/docs/SDG-DOC-DEVS/01-architecture-overview.md
- **Line 16**: References SDG-FETCH as providing "system info"

### SDG-DOCS/docs/SDG-DOC-AGENTS/01-path-conventions.md
- **Line 61**: `command -v sdgfetch` listed as canonical system-info command

### SDG-DOCS/docs/SDG-DOC-DEVS/04-sdgpkg-reference.md
- **Line 58**: `sdg-fetch/` listed as cloned repo under sdgpkg cache

### GLOBAL-MIGRATION-GUIDE.md
- **Lines 129, 138-139**: SDG-TERM references to `~/.local/SDG-FETCH/fetch.sh` and `fetch-conf.sh`
- **Lines 163-184**: Full rewrite mapping for old `~/.config/sdgos/fastfetch/` → new `~/.config/SDG-FETCH/` and `~/.local/SDG-FETCH/`
- **Line 177**: `~/.config/fetch.state` → `~/.config/SDG-FETCH/fetch.state`

### SDG-REPO-OLD/migration-plan.md
- **Line 18**: Listed as fully migrated (`✅`)

---

## Use / Configuration

### Entrypoints
- `sdgfetch [distro]` — runs fastfetch with saved logo+conf; optional distro for per-boot overrides
- `sdgfetch-conf` — invokes TUI selector, then runs `sdgfetch` implicitly

### State selection logic (`fetch.sh:16-36`)
1. If `$DISTRO` arg is provided:
   - For `distro-themed` logo: applies custom logo colors
   - Otherwise: uses distro logo with default colors
2. If no arg, reads `~/.config/fetch.state` (line 10-11):
   - `none` → `fastfetch -l none`
   - `distro` → default distro logo
   - `distro-themed` → distro logo with custom colors
   - anything else → treat as filename in `$SRC_DIR` (ASCII art file)

### Config presets (49 `.jsonc` files)
- `config/SDG-FETCH/conf/` — 49 fastfetch configs ranging from minimal to very-fancy
- All reference `"$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json"`
- Include common modules: title, os, kernel, packages, shell, terminal, wm, cpu, gpu, memory, disk, battery, colors

### Source images (33 files)
- `config/SDG-FETCH/src/` — brand logos (arch, apple, windows variants, alienware, thinkpad, etc.) and misc (dank, prides, warframe, etc.)

### Generated ASCII (45 files)
- `config/SDG-FETCH/gen/` — converted from source images; includes extra entries (`archbtw`, `cachy`, `distro`, `distro-themed`, `hypr`, `hypr-alt`, `ibm`, `noodle`, `none`, `rose`, `surface`, `triangle`) that may come from another source or were manually created.

### Install flow (`install.sh`)
1. Installs dependencies via unipkg
2. Copies `config/*` → `~/.config/` (flat, not `~/.config/SDG-FETCH/`)
3. Copies `local/*` → `~/.local/` (flat, includes SDG-FETCH/ subdir)
4. Creates `~/.local/docs/` and `~/.local/tips/`, copies docs/tips
5. Symlinks `fetch.sh` → `/usr/bin/sdgfetch`, `fetch-conf.sh` → `/usr/bin/sdgfetch-conf`

---

## Deprecation / Outdated Items

### 1. `fetch.state` uses old path (`~/.config/fetch.state`)
- **`local/SDG-FETCH/fetch.sh:10-11`**: reads from `~/.config/fetch.state`
- **`local/SDG-FETCH/fetch-conf.sh:12`**: writes to `~/.config/fetch.state`
- **`docs/SDG-FETCH/README.md:17`**: documents old path
- **Should be**: `~/.config/SDG-FETCH/fetch.state`
- Referenced correctly in: `migration-plan.md:31`, `GLOBAL-MIGRATION-GUIDE.md:177`

### 2. `gen/` directory mislocated
- **`local/SDG-FETCH/fetch.sh:7`**: `SRC_DIR="$HOME/.config/SDG-FETCH/gen"` — should be `$HOME/.local/SDG-FETCH/gen`
- **`local/SDG-FETCH/fetch-conf.sh:5`**: same issue
- **`local/SDG-FETCH/update-files.sh:5`**: `OUT_DIR="$HOME/.config/SDG-FETCH/gen"` — should be `$HOME/.local/SDG-FETCH/gen`
- Generated/writable data belongs under `~/.local/`, not `~/.config/`
- Referenced correctly in: `migration-plan.md:20,27,37`, `GLOBAL-MIGRATION-GUIDE.md:167,175,184`

### 3. `fetch-conf.sh:8,10` — hardcoded preview paths
- **Line 8**: `bat ~/.config/SDG-FETCH/gen/{}` should be `bat $HOME/.local/SDG-FETCH/gen/{}`
- **Line 10**: `fastfetch ... -c ~/.config/SDG-FETCH/conf/{}` uses hardcoded `~` instead of `$HOME`

### 4. Hardcoded `/home/$(whoami)/` paths in lifecycle scripts
- **`install.sh:10,13,16,19-22,25,28-29,32-33`**: all use `/home/$(whoami)/` instead of `$HOME`
- **`uninstall.sh:3-5`**: same pattern
- **`update.sh:3-6,8-13`**: same pattern
- Breaks on systems where `$HOME` != `/home/$(whoami)/` (e.g. custom homedirs, root, NixOS)

### 5. `install.sh` copies flat to `~/.config/` (line 13)
- `cp -r $WORKDIR/config/* /home/$(whoami)/.config` would flatten all config into `~/.config/` — should be `~/.config/SDG-FETCH/`
- Migration-plan.md:44 correctly says `~/.config/SDG-FETCH/`

### 6. Empty / near-empty directories and files
- `tips/SDG-FETCH/exampletips.md` — empty file
- `docs/SDG-FETCH/README.md` — bare-minimum 22-line doc, references old paths
- `TESTCOMPLETE.md` — completely empty
- `README.md` (root) — just "# SDG-FETCH"
- `other/` — empty directory
- `cache/` — empty directory

### 7. `gen/` has mismatched files vs `src/`
- In `gen/` but not in `src/`: `archbtw`, `cachy`, `distro`, `distro-themed`, `hypr`, `hypr-alt`, `ibm`, `none`, `noodle`, `rose`, `surface`, `triangle` (12 extra files)
- These appear to be manually created or migrated from the old `~/.config/sdgos/fastfetch/gen/` — source images missing from this repo

### 8. Missing lifecycle scripts per migration-plan
- `detect.sh` called for in `migration-plan.md:47` but does not exist
- `uninstall.sh:3` removes `~/.local/SDG-FETCH` but not `~/.config/SDG-FETCH/` (config dir not cleaned)
- `update.sh` does not re-run `update-files.sh` (so new images won't be converted)

### 9. Cross-repo stale reference
- `SDG-DOCS/docs/SDG-DOC-DEVS/04-sdgpkg-reference.md:58` mentions `sdg-fetch/` as a cloned repo path — should be verified against current sdgpkg layout
