#!/bin/bash

rm -rf /home/$(whoami)/.local/SDG-FETCH
rm -rf /home/$(whoami)/.local/docs/SDG-FETCH
rm -rf /home/$(whoami)/.local/tips/SDG-FETCH
sudo unlink /usr/bin/sdgfetch
sudo unlink /usr/bin/sdgfetch-conf

