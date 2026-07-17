#!/bin/bash

### dependencies
unipkg install any jp2a
unipkg install any fastfetch
unipkg install any fzf
unipkg install any bat

WORKDIR="$HOME/.cache/SDG-PKG/sdg-fetch"

mkdir -p "$HOME/.local/fetch"
cp -r "$WORKDIR/other/"* "$HOME/.local/fetch"
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

chmod a+x "$HOME/.local/SDG-FETCH/fetch-cli.sh"

sudo ln -sf "$HOME/.local/SDG-FETCH/fetch-cli.sh" /usr/bin/sdgfetch

### set default state
mkdir -p "$HOME/.config"
echo "SDG-FETCH/triangle:SDG-FETCH/default.jsonc" > "$HOME/.config/sdgfetch.state"

which sdgfetch || echo "INSTALL FAILED!"
