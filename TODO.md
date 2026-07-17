# TODO — SDG-FETCH

## Modularization
_(pre-existing — see below)_

Restructure SDG-FETCH so that separate SDG packages can deploy their own fastfetch configs and ASCII logos without modifying core SDG-FETCH files.

- [ ] Define a shared base `fetch.sh` that sources logo and preset directories from a configurable list of paths
- [ ] Allow packages to register extra logo/preset directories via a simple drop-in mechanism (e.g., symlinks in `~/.config/SDG-FETCH/contrib/` or a `.d` pattern)
- [ ] Build a unified `sdgfetch-conf` that merges picker lists from all registered sources
- [ ] Document the convention so package maintainers know how to hook in
- [ ] Ensure backward compatibility: existing `~/.config/SDG-FETCH/gen/` and `~/.config/SDG-FETCH/conf/` continue to work
- [ ] Update install.sh, update.sh, and CI to handle the new structure

---

## Documentation
- [x] Verify all 45 logos documented/present — **42 logos exist; docs updated to match**
- [x] Verify all 49 presets documented — **49 confirmed**
- [x] Remove specific counts from docs — **done, counts removed or corrected**
- [ ] Document category-based lookup in docs (package drop-in convention)

## Testing
- [ ] All logo presets render
- [ ] All display presets render
- [ ] `sdgfetch config` (subcommand) interactive configurator
- [ ] Runs without error on terminal startup

## Changes
- [x] Fix install.sh symlink typo (`fetch.sh-cli` → `fetch-cli.sh`)
- [x] Fix uninstall.sh dangling `sdgfetch-conf` unlink
- [x] Align doc paths with actual code paths (`~/.local/fetch/` not `~/.config/SDG-FETCH/`)
- [x] Fix state file references (`sdgfetch.state` not `fetch.state`)
- [x] Fix script name references (`fetch-cli.sh` not `fetch.sh`)
- [x] Remove references to non-existent scripts (`update-files.sh`, `fetch-conf.sh`)
- [x] Fix `sdgfetch-conf` docs: it's `sdgfetch config` subcommand, not a separate binary
- [x] Fix TEST-CHECKLIST.md to use actual CLI commands
- [x] Fix tips.list theming claim for `sdgfetch <distro>`
- [ ] Verify all changes are consistent
