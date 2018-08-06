#!/bin/bash

echo ""
echo "- Install NeoVim plugin: prettier ..."

. /setups/util/trace_output.sh
(

    cd ~/.config/nvim/plugged/vim-prettier
    npm install
) 2>&1 | trace_output

