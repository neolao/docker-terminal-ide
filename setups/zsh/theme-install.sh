#!/bin/bash

echo ""
echo "- Install ZSH: Theme ... "

. /setups/util/trace_output.sh
(
    if [ ! -d ~/.oh-my-zsh-custom/themes/powerlevel9k ]
    then
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh-custom/themes/powerlevel9k
    fi
) 2>&1 | trace_output

