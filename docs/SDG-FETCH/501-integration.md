# Integration

## Terminal Startup

SDG-FETCH is used by **SDG-TERM**, which runs `sdgfetch` in Ghostty's `initial-command` setting. This displays system information with the selected logo on every new terminal window.

To add to your own shell startup:

```bash
# ~/.bashrc or ~/.zshrc
sdgfetch
```

## Cross-Package Usage

SDG-FETCH can be called from other scripts or packages. The CLI entry point is:

- `/usr/bin/sdgfetch` — Display system info and open the interactive configurator (`sdgfetch config`)

Other SDG modules can contribute their own logos and presets by placing files in the standard fetch directories:

| Path | Convention |
|------|------------|
| `~/.local/fetch/logos/<module>/` | Logos contributed by a module (appear as `<module>/<filename>`) |
| `~/.local/fetch/conf/<module>/` | Presets contributed by a module (appear as `<module>/<filename>`) |

SDG-FETCH scans all subdirectories of `~/.local/fetch/logos/` and `~/.local/fetch/conf/`, so any module that installs files there automatically extends the library — no registration needed.

Installation paths for programmatic access:

| Path | Contents |
|------|----------|
| `~/.local/SDG-FETCH/fetch-cli.sh` | Main CLI script |
| `~/.local/fetch/logos/` | ASCII art logo files (organized by category subdirectories) |
| `~/.local/fetch/conf/` | Fastfetch preset files (organized by category subdirectories) |
| `~/.config/sdgfetch.state` | Persistent state |
| `~/.local/docs/SDG-FETCH/` | Documentation |
| `~/.local/tips/SDG-FETCH/` | Tips |

## Related Packages

- **SDG-TERM** — Launches `sdgfetch` on terminal startup
- **SDG-DOCS** — Indexes and serves these documentation files
