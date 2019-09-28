#!/bin/bash

if [ ! -f ~/.nvm/nvm.sh ]; then
    exit 0
fi

. ~/.nvm/nvm.sh
export NVM_DIR=$(realpath ~/.nvm)
nvm use $NODEJS_DEFAULT_VERSION > /dev/null 2>&1
version=$(nvm current)

jsonlint_needed=0

if [ ! -f ~/.nvm/versions/node/$version/bin/jsonlint ];then
    jsonlint_needed=1
fi

if [ $jsonlint_needed -eq 1 ]; then
    echo ""
    echo "- Install NeoVim plugin: syntastic ..."

    . /setups/util/trace_output.sh
    (
        npm install -g jsonlint
    ) 2>&1 | trace_output
fi

