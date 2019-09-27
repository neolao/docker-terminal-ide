#!/bin/bash

echo ""
echo "- Install ZSH: Oh My Zsh ... "

. /setups/util/trace_output.sh
(
    if [ ! -f "~/.oh-my-zsh/oh-my-zsh.sh" ]; then
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
) 2>&1 | trace_output

