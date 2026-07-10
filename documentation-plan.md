# SDG-FETCH Documentation Plan

## Current Status
One doc file exists (`docs/SDG-FETCH/README.md`, 22 lines — a quick reference). No tips exist (placeholder only).

## Docs System (`docs/`)
**Deploy location**: `~/.local/docs/SDG-FETCH/`

### Existing Docs
| File | Topic |
|------|-------|
| README.md | Quick reference (22 lines): commands, directory structure, update-files.sh |

### Planned Doc Topics
| # | Topic | Description | Priority |
|---|-------|-------------|----------|
| 1 | Usage Guide | How to use sdgfetch and sdgfetch-conf with examples | High |
| 2 | Logo Library | Full listing of all 45 ASCII logos with preview descriptions | Medium |
| 3 | Preset Reference | Description of all 49 fastfetch presets organized by style category | Medium |
| 4 | Customization | How to add custom logos (place images in src/, run sdgfetch-conf) | High |
| 5 | Configuration | fetch.state format, how to manually edit selections | Low |
| 6 | Integration | How SDG-TERM uses sdgfetch on terminal startup | Low |

### Implementation
- Convert existing README.md into a proper 01-usage-guide.md
- Add logo-library.md, preset-reference.md, customization.md
- Follow SDG-DOCS naming convention

## Tips System (`tips/`)
**Deploy location**: `~/.local/tips/SDG-FETCH/`

### Existing Tips
None (tips/SDG-FETCH/exampletips.md is an empty placeholder)

### Planned Tips
| # | Tip | Description | Priority |
|---|-----|-------------|----------|
| 1 | Run sdgfetch | Display system info with current logo/preset | High |
| 2 | Configure fetch | `sdgfetch-conf` — pick a logo and preset interactively | High |
| 3 | Add custom logo | Place a PNG in `~/.config/SDG-FETCH/src/` and run sdgfetch-conf | Medium |
| 4 | Distro-themed | `sdgfetch archlinux` — use a distro logo with themed config | Medium |
| 5 | Update images | Images in src/ are auto-converted to ASCII on config run | Low |

### Implementation
- Create `tips/SDG-FETCH/tips.list` with the above tips
- Register in `install.sh` for deployment to `~/.local/tips/`
