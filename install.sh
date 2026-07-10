#!/bin/bash

### dependencies
unipkg install any jp2a
unipkg install any fastfetch
unipkg install any fzf
unipkg install any bat

WORKDIR="$HOME/.cache/SDG-PKG/sdg-fetch"

cp -r "$WORKDIR/config/"* "$HOME/.config/"
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

chmod a+x "$HOME/.local/SDG-FETCH/fetch.sh"

sudo ln -sf "$HOME/.local/SDG-FETCH/fetch.sh" /usr/bin/sdgfetch
sudo ln -sf "$HOME/.local/SDG-FETCH/fetch-conf.sh" /usr/bin/sdgfetch-conf

which sdgfetch || echo "INSTALL FAILED!"
which sdgfetch-conf || echo "INSTALL FAILED!"
