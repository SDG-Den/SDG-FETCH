#!/bin/bash

WORKDIR="$HOME/.cache/SDG-PKG/sdg-fetch"

rm -rf "$HOME/.local/SDG-FETCH"
cp -r "$WORKDIR/local/"* "$HOME/.local/"

rm -rf "$HOME/.local/docs/SDG-FETCH" "$HOME/.local/tips/SDG-FETCH"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

sudo ln -sf "$HOME/.local/SDG-FETCH/fetch-cli.sh" /usr/bin/sdgfetch
