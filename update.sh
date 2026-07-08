#!/bin/bash

rm -rf /home/$(whoami)/.local/SDG-FETCH
cp -r /home/$(whoami)/.cache/SDG-PKG/sdg-fetch/local/* /home/$(whoami)/.local
sudo ln -sf /home/$(whoami)/.local/SDG-FETCH/fetch.sh /usr/bin/sdgfetch
sudo ln -sf /home/$(whoami)/.local/SDG-FETCH/fetch-conf.sh /usr/bin/sdgfetch-conf

rm -rf /home/$(whoami)/.local/docs/SDG-FETCH
rm -rf /home/$(whoami)/.local/tips/SDG-FETCH
mkdir -p /home/$(whoami)/.local/docs
mkdir -p /home/$(whoami)/.local/tips
cp -r /home/$(whoami)/.cache/SDG-PKG/sdg-fetch/docs/* /home/$(whoami)/.local/docs
cp -r /home/$(whoami)/.cache/SDG-PKG/sdg-fetch/tips/* /home/$(whoami)/.local/tips


