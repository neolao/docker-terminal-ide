#!/bin/bash

scriptPath=$(readlink -f $0)
currentDirectory=$(dirname $scriptPath)
currentDirectory=$(realpath $currentDirectory)

# Select the workspace
FILE_TO_OPEN=""
workspace=$(pwd)
if [ -n "$1" ]
then
    workspace=$(realpath $1)
fi
if [ -f $workspace ]
then
    FILE_TO_OPEN=$workspace
    workspace=$(dirname $workspace)
    directoryLength=${#workspace}+1
    FILE_TO_OPEN=${FILE_TO_OPEN:$directoryLength}
fi

# Select the preset
preset="default"
if [ -n "$2" ]
then
    preset=$2
fi

# Configuration
NODEJS_DEFAULT_VERSION=8
NEOVIM_PLUGIN_PHPCD=0
NEOVIM_PLUGIN_TERN=1
case $preset in
    default)
        image="neolao/ide"
        ;;

    php)
        image="neolao/ide:php"
        NEOVIM_PLUGIN_PHPCD=1
        ;;

    *)
        echo "Invalid preset"
        exit 1
esac

# Run the editor
GID=$(id -g)
cd $currentDirectory
docker run -it --rm \
    -e USER_NAME=$USER \
    -e USER_UID=$UID \
    -e USER_GID=$GID \
    -e FILE_TO_OPEN=$FILE_TO_OPEN \
    -e NODEJS_DEFAULT_VERSION=$NODEJS_DEFAULT_VERSION \
    -e NEOVIM_PLUGIN_PHPCD=$NEOVIM_PLUGIN_PHPCD \
    -e NEOVIM_PLUGIN_TERN=$NEOVIM_PLUGIN_TERN \
    -e LAUNCHER=/launchers/tmux-nvim.sh \
    -v "/etc/passwd:/etc/passwd:ro" \
    -v "/etc/shadow:/etc/shadow:ro" \
    -v "/etc/group:/etc/group:ro" \
    -v "$HOME/.ssh:/home/$USER/.ssh:rw" \
    -v "$HOME/.gitconfig:/home/$USER/.gitconfig:ro" \
    -v "$currentDirectory/setups:/setups:ro" \
    -v "$currentDirectory/launchers:/launchers:ro" \
    -v "$currentDirectory/config/etc/hostname:/etc/hostname:ro" \
    -v "$currentDirectory/config/zsh/zshrc:/home/$USER/.zshrc:ro" \
    -v "$currentDirectory/config/zsh/oh-my-zsh:/home/$USER/.oh-my-zsh:rw" \
    -v "$currentDirectory/config/zsh/oh-my-zsh-custom:/home/$USER/.oh-my-zsh-custom:rw" \
    -v "$currentDirectory/config/tmux/tmux.conf:/home/$USER/.tmux.conf:ro" \
    -v "$currentDirectory/config/neovim/plug.vim:/home/$USER/plug.vim:ro" \
    -v "$currentDirectory/config/neovim/plugged:/home/$USER/.config/nvim/plugged:rw" \
    -v "$currentDirectory/config/neovim/themes:/home/$USER/.config/nvim/themes:ro" \
    -v "$currentDirectory/config/neovim/init:/home/$USER/.config/nvim/init:ro" \
    -v "$currentDirectory/config/neovim/init.vim:/home/$USER/.config/nvim/init.vim:ro" \
    -v "$currentDirectory/config/neovim/rplugin.vim:/home/$USER/.local/share/nvim/rplugin.vim:ro" \
    -v "$currentDirectory/config/home/.nvm:/home/$USER/.nvm:rw" \
    -v "$currentDirectory/applications:/applications:rw" \
    -v "$currentDirectory/bin/composer.phar:/usr/local/bin/composer:rw" \
    -v "/:/disk:ro" \
    -v "$workspace:/workspace:rw" \
    $image
