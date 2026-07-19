#!/bin/bash

LOCALDIR=SDG-FETCH
DOCDIR=SDG-FETCH
TIPDIR=SDG-FETCH
entrypoint=fetch-cli.sh
command=sdgfetch

WORKDIR=$(pwd)

rm -rf "$HOME/.local/docs/$DOCDIR" "$HOME/.local/tips/$TIPDIR" "$HOME/.local/$LOCALDIR" "$HOME/.local/fetch"

mkdir -p "$HOME/.local/$LOCALDIR" "$HOME/.local/fetch"
cp -r "$WORKDIR/other/"* "$HOME/.local/fetch"
cp -r "$WORKDIR/config/"* "$HOME/.config/" 2>/dev/null || true
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

chmod a+x "$HOME/.local/SDG-FETCH/fetch-cli.sh"

sudo ln -sf "$HOME/.local/$LOCALDIR/$entrypoint" /usr/bin/$command

echo "SDG-FETCH/triangle:SDG-FETCH/default.jsonc" > "$HOME/.config/sdgfetch.state"

which $command || echo "INSTALL FAILED!"
