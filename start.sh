#!/bin/bash

scriptPath=$(readlink -f $0)
currentDirectory=$(dirname $scriptPath)
currentDirectory=$(realpath $currentDirectory)

GID=$(id -g)
#export UID
#export GID

# Select the workspace
workspace=$(pwd)
if [ -n "$1" ]
then
    workspace=$(realpath $1)
fi

# Select the preset
preset="default"
if [ -n "$2" ]
then
    preset=$2
fi

# Configuration
NEOVIM_PLUGIN_PHPCD=0
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
cd $currentDirectory
docker run -it --rm \
    -e USER_NAME=$USER \
    -e USER_UID=$UID \
    -e USER_GID=$GID \
    -e NEOVIM_PLUGIN_PHPCD=$NEOVIM_PLUGIN_PHPCD \
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
    -v "$currentDirectory/config/neovim/init.vim:/home/$USER/.config/nvim/init.vim:ro" \
    -v "$currentDirectory/config/neovim/rplugin.vim:/home/$USER/.local/share/nvim/rplugin.vim:ro" \
    -v "$currentDirectory/config/home/.nvm:/home/$USER/.nvm:rw" \
    -v "$currentDirectory/bin/composer.phar:/usr/local/bin/composer:rw" \
    -v "/:/disk:ro" \
    -v "$workspace:/workspace:rw" \
    $image
