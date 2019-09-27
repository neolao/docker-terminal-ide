#!/bin/bash

echo ""
echo "- Install ZSH: Oh My Zsh ... "

. /setups/util/trace_output.sh
(
    if [ -f ~/.oh-my-zsh-mounted/oh-my-zsh.sh ]
    then
        ln -s ~/.oh-my-zsh-mounted ~/.oh-my-zsh
    else
        sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        cp -r ~/.oh-my-zsh/* ~/.oh-my-zsh-mounted
        cp -r ~/.oh-my-zsh/.* ~/.oh-my-zsh-mounted
    fi
) 2>&1 | trace_output

