#!/bin/bash

cd ~/.config/nvim/plugged/vimproc.vim
if [ ! -f "./lib/vimproc_linux64.so" ]
then
    echo "Install NeoVim plugin: vimproc ..."
    make
fi

