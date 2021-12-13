#!/bin/bash

if [ ! "$NODEJS_DEFAULT_VERSION" -eq 0 ]
then
    # Fix MacOS
    sudo mkdir /Users
    sudo chmod 777 /Users

    nvm_needed=0
    node_needed=0
    yarn_needed=0
    install_needed=0

    if [ ! -f ~/.nvm/nvm.sh ]; then
        nvm_needed=1
        node_needed=1
        yarn_needed=1
        install_needed=1
    else
        . ~/.nvm/nvm.sh
        export NVM_DIR=$(realpath ~/.nvm)

        node_path=$(nvm which $NODEJS_DEFAULT_VERSION)
        if [ -z "$node_path" ]; then
            node_needed=1
            yarn_needed=1
            install_needed=1
        else
            nvm use $NODEJS_DEFAULT_VERSION > /dev/null 2>&1
            node_path=$(which node)
            npm_path=$(which npm)
            sudo ln -s $node_path /usr/local/bin/node
            sudo ln -s $npm_path /usr/local/bin/npm

            version=$(nvm current)

            if [ ! -f ~/.nvm/versions/node/$version/bin/yarn ]; then
                yarn_needed=1
                install_needed=1
            fi
        fi
    fi

    if [ $install_needed -eq 1 ]; then
        echo ""
        echo "- Configure NodeJS default version ... "
    else
        exit 0
    fi

    if [ $nvm_needed -eq 1 ]; then
        . /setups/util/trace_output.sh
        (
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
        ) 2>&1 | trace_output
    fi

    . ~/.nvm/nvm.sh
    export NVM_DIR=$(realpath ~/.nvm)

    if [ $node_needed -eq 1 ]; then
        . /setups/util/trace_output.sh
        (
            nvm install $NODEJS_DEFAULT_VERSION
        ) 2>&1 | trace_output
    fi

    nvm use $NODEJS_DEFAULT_VERSION > /dev/null 2>&1
    nvm alias default $NODEJS_DEFAULT_VERSION
    node_path=$(which node)
    npm_path=$(which npm)
    sudo ln -s $node_path /usr/local/bin/node
    sudo ln -s $npm_path /usr/local/bin/npm

    if [ $yarn_needed -eq 1 ]; then
        . /setups/util/trace_output.sh
        (
            npm install -g yarn
        ) 2>&1 | trace_output
    fi
else
    exit 0
fi
