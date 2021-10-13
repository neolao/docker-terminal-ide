#!/bin/bash

if [ ! "$PHP" -eq 0 ]
then
    echo "Configure PHP ..."

    if [ ! -f ~/.phpenv/README.md ]; then
        git clone git://github.com/phpenv/phpenv.git ~/.phpenv
    fi
    export PATH="$HOME/.phpenv/bin:$PATH"

    if [ ! -d ~/.phpenv/plugins/php-build ]; then
        git clone https://github.com/php-build/php-build ~/.phpenv/plugins/php-build
    fi

    if [ ! -d ~/.phpenv/plugins/pecl-build ]; then
        git clone https://github.com/crocos/pecl-build.git ~/.phpenv/plugins/pecl-build
    fi

    phpenv install --skip-existing $PHP_DEFAULT_VERSION
    phpenv rehash
    export PHPENV_VERSION=$PHP_DEFAULT_VERSION

    # Configure phpactor
    sudo ln -s ~/.config/nvim/plugged/phpactor/bin/phpactor /usr/local/bin/phpactor
fi
