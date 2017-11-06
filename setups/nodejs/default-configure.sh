#!/bin/bash

if [ ! "$NODEJS_DEFAULT_VERSION" -eq 0 ]
then
    echo "Configure NodeJS default version ..."
else
    exit 0
fi

set -e

if [ ! -e "/usr/local/bin/node" ]
then
    . ~/.nvm/nvm.sh
    export NVM_DIR=$(realpath ~/.nvm)
    nvm install $NODEJS_DEFAULT_VERSION
    nvm use $NODEJS_DEFAULT_VERSION
    node_path=$(which node)
    npm_path=$(which npm)
    sudo ln -s $node_path /usr/local/bin/node
    sudo ln -s $npm_path /usr/local/bin/npm
fi


