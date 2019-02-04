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
    # Fix MacOS
    sudo mkdir /Users
    sudo chmod 777 /Users

    . ~/.nvm/nvm.sh
    export NVM_DIR=$(realpath ~/.nvm)
    nvm install $NODEJS_DEFAULT_VERSION
    node_path=$(which node)
    npm_path=$(which npm)
    sudo ln -s $node_path /usr/local/bin/node
    sudo ln -s $npm_path /usr/local/bin/npm
    npm install -g yarn
) 2>&1 | trace_output

