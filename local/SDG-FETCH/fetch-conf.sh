#!/bin/bash

bash -c ~/.local/SDG-FETCH/update-files.sh

SRC_DIR="$HOME/.config/SDG-FETCH/gen"
CONF_DIR="$HOME/.config/SDG-FETCH/conf"

SELECTEDLOGO=$(ls -1 $SRC_DIR | fzf --layout=reverse --preview-window=right:70% --prompt='Select a logo: ' --preview-label='Preview:' --preview='bat ~/.config/SDG-FETCH/gen/{}')

SELECTEDCONF=$(ls -1 $CONF_DIR | fzf --layout=reverse --preview-window=down:70%,nowrap --color='pointer:green,marker:green' --prompt='Select a config style: ' --preview-label='Preview:' --preview='bash -c "fastfetch --disable-linewrap 1 -l none -c ~/.config/SDG-FETCH/conf/{}"')

echo "$SELECTEDLOGO:$SELECTEDCONF" > ~/.config/fetch.state
