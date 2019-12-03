#!/bin/bash

if [ ! "$TYPESCRIPT" -eq 0 ]
then
    if [ ! -f ~/.nvm/nvm.sh ]; then
        echo "NVM not installed"
        exit 1
    fi

    . ~/.nvm/nvm.sh
    export NVM_DIR=$(realpath ~/.nvm)
    nvm use $NODEJS_DEFAULT_VERSION > /dev/null 2>&1
    version=$(nvm current)

    install_needed=0
    typescript_needed=0
    tsctags_needed=0

    if [ ! -f ~/.nvm/versions/node/$version/bin/tsc ];then
        typescript_needed=1
        install_needed=1
    fi
    if [ ! -f ~/.nvm/versions/node/$version/bin/ts-ctags ];then
        tsctags_needed=1
        install_needed=1
    fi

    if [ $install_needed -eq 1 ]; then
        echo ""
        echo "- Configure Typescript ... "
    fi

    if [ $typescript_needed -eq 1 ]; then
        . /setups/util/trace_output.sh
        (
            npm install -g typescript
        ) 2>&1 | trace_output
    fi
    if [ $tsctags_needed -eq 1 ]; then
        . /setups/util/trace_output.sh
        (
            npm install -g ts-ctags
        ) 2>&1 | trace_output
    fi

    #mkdir -p ~/.config/nvim/plugged/vim-polyglot/ctags
    #touch ~/.config/nvim/plugged/vim-polyglot/ctags/typescript.ctags
else
    exit 0
fi


