#!/bin/bash

exit 0

if [ "$NEOVIM_PLUGIN_PHPCD" -eq 1 ]
then
    echo ""
    echo "- Install NeoVim plugin: phpcd ..."
else
    exit 0
fi

cd ~/.config/nvim/plugged/phpcd.vim
if [ -d "./vendor" ]
then
    echo "OK" | trace_output
    exit 0
fi


. /setups/util/trace_output.sh
(
    composer install
) 2>&1 | trace_output

