# SDG-FETCH Documentation Plan

## Current Status
One doc file exists (`docs/SDG-FETCH/README.md`, 22 lines — quick reference). Zero tips exist (`tips/SDG-FETCH/exampletips.md` is empty).

## Source-Verified Inventory
**Components:**
- 2 CLI entry points: `sdgfetch` (fetch.sh), `sdgfetch-conf` (fetch-conf.sh)
- 45 ASCII art logos in `config/SDG-FETCH/gen/` (brands, distros, fun, themes)
- 49 fastfetch presets in `config/SDG-FETCH/conf/` (neofetch-clone, framed, tree, minimal, comprehensive, themed, Nex)
- 31 source images in `config/SDG-FETCH/src/` (PNG/JPG for conversion)
- Auto-conversion pipeline via `update-files.sh` using `jp2a --height=22 --colors --background=dark`
- Persistent state: `~/.config/fetch.state` (`logoName:configName`)
- Distro override: `sdgfetch archlinux` passes distro argument
- distro-themed logo with ANSI color overrides
- Dependencies: fastfetch, jp2a, fzf, bat

## Docs System (`docs/`)
**Deploy location**: `~/.local/docs/SDG-FETCH/`

### Planned Doc Topics
| # | Topic | Description | Priority |
|---|-------|-------------|----------|
| 1 | Usage Guide | Running sdgfetch, sdgfetch-conf, CLI options | High |
| 2 | Logo Library | All 45 logos categorized, how they work, custom distro logos | Medium |
| 3 | Preset Reference | All 49 presets with screenshots and descriptions | Medium |
| 4 | Customization | Adding custom logos, modifying presets, ANSI color overrides | High |
| 5 | Configuration | fetch.state format, distro override, theme coloring | Low |
| 6 | Integration | Startup integration (runs in terminal), cross-package usage | Low |

### Existing Content
| File | Notes |
|------|-------|
| `docs/SDG-FETCH/README.md` | 22 lines — quick reference. Source material but too brief |
| `README.md` (root) | Feature overview |
| `analysis.md` | Full architecture, directory structure, CLI usage |

## Tips System (`tips/`)
**Deploy location**: `~/.local/tips/SDG-FETCH/`

### Planned Tips
| # | Tip | Priority |
|---|-----|----------|
| 1 | Run sdgfetch to display system info with a logo | High |
| 2 | sdgfetch-conf lets you pick logos and presets interactively | High |
| 3 | Add custom logos by placing images in config/SDG-FETCH/src/ | Medium |
| 4 | sdgfetch archlinux shows a themed display | Medium |
| 5 | Run update-files.sh to convert new source images | Low |

## Implementation Notes
- Docs in `nn-topic-name.md` format under `docs/SDG-FETCH/`
- Tips in `tips/SDG-FETCH/tips.list`
- Logo source: 45 files in `config/SDG-FETCH/gen/`, 49 presets in `config/SDG-FETCH/conf/`
- The `exampletips.md` file is empty — remove it and replace with `tips.list`
