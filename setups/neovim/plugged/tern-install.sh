#!/bin/bash

if [ "$NODEJS_DEFAULT_VERSION" -eq 0 ]; then
    exit 0
fi
if [ ! -f ~/.nvm/nvm.sh ]; then
    exit 0
fi

. ~/.nvm/nvm.sh
export NVM_DIR=$(realpath ~/.nvm)
nvm use $NODEJS_DEFAULT_VERSION > /dev/null 2>&1

tern_install_needed=0

if [ ! -d ~/.config/nvim/plugged/tern_for_vim/node_modules ];then
    tern_install_needed=1
fi

if [ $tern_install_needed -eq 1 ]; then
    echo ""
    echo "- Install NeoVim plugin: tern ..."

    . /setups/util/trace_output.sh
    (
        cd ~/.config/nvim/plugged/tern_for_vim
        npm install --no-package-lock
    ) 2>&1 | trace_output
fi

