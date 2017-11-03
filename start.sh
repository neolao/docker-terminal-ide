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

cd $currentDirectory
docker-compose run \
    -e USER_NAME=$USER \
    -e USER_UID=$UID \
    -e USER_GID=$GID \
    -v "/etc/passwd:/etc/passwd:ro" \
    -v "/etc/shadow:/etc/shadow:ro" \
    -v "/etc/group:/etc/group:ro" \
    -v "$HOME/.ssh:/home/$USER/.ssh:rw" \
    -v "$HOME/.gitconfig:/home/$USER/.gitconfig:ro" \
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
    editor
