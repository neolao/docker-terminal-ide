#!/bin/bash

if [ -d "~/.config/nvim/plugged/vimproc.vim" ]; then
    cd ~/.config/nvim/plugged/vimproc.vim
    if [ -f "./lib/vimproc_linux64.so" ]
    then
        exit 0
    fi

    echo ""
    echo "- Install NeoVim plugin: vimproc ..."

    . /setups/util/trace_output.sh
    (
        make
    ) 2>&1 | trace_output
fi

