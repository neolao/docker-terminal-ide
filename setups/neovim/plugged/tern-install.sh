#!/bin/bash

if [ "$NEOVIM_PLUGIN_TERN" -eq 1 ]
then
    echo "Install NeoVim plugin: tern ..."
else
    exit 0
fi

cd ~/.config/nvim/plugged/tern_for_vim
if [ ! -d "./node_modules" ]
then
    npm install
fi
