#!/bin/bash

if [ "$NEOVIM_PLUGIN_PRETTIER" -eq 1 ]
then
    echo ""
    echo "- Install NeoVim plugin: prettier ... "
else
    exit 0
fi

. /setups/util/trace_output.sh
(
    if [ -d "~/.config/nvim/plugged/vim-prettier" ]; then
        cd ~/.config/nvim/plugged/vim-prettier
        npm install --no-package-lock
    fi
) 2>&1 | trace_output

