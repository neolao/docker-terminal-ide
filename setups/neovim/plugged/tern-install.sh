#!/bin/bash

if [ "$NEOVIM_PLUGIN_TERN" -eq 1 ]
then
    echo ""
    echo "- Install NeoVim plugin: tern ... "
else
    exit 0
fi


. /setups/util/trace_output.sh
(
    if [ ! -x "$(command -v npm)" ]
    then
        echo "NPM not available"
    else
        if [ -d "~/.config/nvim/plugged/tern_for_vim" ]; then
            cd ~/.config/nvim/plugged/tern_for_vim
            if [ ! -d "./node_modules" ]
            then
                npm install
            fi
            echo "OK"
        else
            echo "Plugin not installed"
        fi
    fi

) 2>&1 | trace_output
