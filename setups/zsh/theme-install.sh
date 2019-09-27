#!/bin/bash

if [ ! -d ~/.oh-my-zsh-custom/themes/powerlevel9k ]
then
    echo ""
    echo "- Install ZSH: Theme ... "

    . /setups/util/trace_output.sh
    (
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh-custom/themes/powerlevel9k
    ) 2>&1 | trace_output
fi

