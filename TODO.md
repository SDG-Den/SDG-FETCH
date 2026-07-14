# TODO — SDG-FETCH Modularization

## Goal

Restructure SDG-FETCH so that separate SDG packages can deploy their own fastfetch configs and ASCII logos without modifying core SDG-FETCH files.

## Plan

- [ ] Define a shared base `fetch.sh` that sources logo and preset directories from a configurable list of paths (e.g., `~/.config/SDG-FETCH/*` + `~/.config/<other-pkg>/*`)
- [ ] Allow packages to register extra logo/preset directories via a simple drop-in mechanism (e.g., symlinks in `~/.config/SDG-FETCH/contrib/` or a `.d` pattern)
- [ ] Build a unified `sdgfetch-conf` that merges picker lists from all registered sources
- [ ] Document the convention so package maintainers know how to hook in
- [ ] Ensure backward compatibility: existing `~/.config/SDG-FETCH/gen/` and `~/.config/SDG-FETCH/conf/` continue to work
- [ ] Update install.sh, update.sh, and CI to handle the new structure
