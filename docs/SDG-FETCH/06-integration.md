# Integration

## Terminal Startup

SDG-FETCH is used by **SDG-TERM**, which runs `sdgfetch` in Ghostty's `initial-command` setting. This displays system information with the selected logo on every new terminal window.

To add to your own shell startup:

```bash
# ~/.bashrc or ~/.zshrc
sdgfetch
```

## Cross-Package Usage

SDG-FETCH can be called from other scripts or packages. The two CLI entry points are:

- `/usr/bin/sdgfetch` — Display system info
- `/usr/bin/sdgfetch-conf` — Open the interactive configurator

Installation paths for programmatic access:

| Path | Contents |
|------|----------|
| `~/.local/SDG-FETCH/fetch.sh` | Source script for sdgfetch |
| `~/.local/SDG-FETCH/fetch-conf.sh` | Source script for sdgfetch-conf |
| `~/.local/SDG-FETCH/update-files.sh` | Image conversion script |
| `~/.config/SDG-FETCH/gen/` | ASCII art logo files |
| `~/.config/SDG-FETCH/conf/` | Fastfetch preset files |
| `~/.config/SDG-FETCH/src/` | Source images for conversion |
| `~/.config/fetch.state` | Persistent state |
| `~/.local/docs/SDG-FETCH/` | Documentation |
| `~/.local/tips/SDG-FETCH/` | Tips |

## Related Packages

- **SDG-TERM** — Launches `sdgfetch` on terminal startup
- **SDG-DOCS** — Indexes and serves these documentation files
