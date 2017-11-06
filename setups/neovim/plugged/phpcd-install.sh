#!/bin/bash

if [ "$NEOVIM_PLUGIN_PHPCD" -eq 1 ]
then
    echo "Install NeoVim plugin: phpcd ..."
else
    exit 0
fi

cd ~/.config/nvim/plugged/phpcd.vim
if [ ! -d "./vendor" ]
then
    composer install
fi
