#!/bin/bash

if [ ! "$NODEJS_DEFAULT_VERSION" -eq 0 ]
then
    echo ""
    echo "- Configure NodeJS default version ... "
else
    exit 0
fi


. /setups/util/trace_output.sh
(
    . ~/.nvm/nvm.sh
    export NVM_DIR=$(realpath ~/.nvm)
    nvm install $NODEJS_DEFAULT_VERSION
    node_path=$(which node)
    npm_path=$(which npm)
    sudo ln -s $node_path /usr/local/bin/node
    sudo ln -s $npm_path /usr/local/bin/npm
) 2>&1 | trace_output

