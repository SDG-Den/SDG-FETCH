#!/bin/bash

### dependencies
unipkg install any jp2a
unipkg install any fastfetch
unipkg install any fzf
unipkg install any bat

# set working directory
WORKDIR=/home/$(whoami)/.cache/SDG-PKG/sdg-fetch

# install default configs
cp -r $WORKDIR/config/* /home/$(whoami)/.config

# install binaries
cp -r $WORKDIR/local/* /home/$(whoami)/.local

# install docs and tips
mkdir -p /home/$(whoami)/.local/docs
mkdir -p /home/$(whoami)/.local/tips
cp -r $WORKDIR/docs/* /home/$(whoami)/.local/docs
cp -r $WORKDIR/tips/* /home/$(whoami)/.local/tips

# make entrypoint executable
chmod a+x /home/$(whoami)/.local/SDG-FETCH/fetch.sh

# symlink entrypoint
sudo ln -sf /home/$(whoami)/.local/SDG-FETCH/fetch.sh /usr/bin/sdgfetch
sudo ln -sf /home/$(whoami)/.local/SDG-FETCH/fetch-conf.sh /usr/bin/sdgfetch-conf

# verify binary
which sdgfetch || echo "INSTALL FAILED!"
which sdgfetch-conf || echo "INSTLAL FAILED!"

sdgfetch-conf

