#!/bin/bash

currentDirectory=$(dirname $0)
currentDirectory=$(realpath $currentDirectory)

GID=$(id -g)
#export UID
#export GID

workspace=$(realpath $1)

docker-compose run \
    -e USER_NAME=$USER \
    -e USER_UID=$UID \
    -e USER_GID=$GID \
    -v "/etc/passwd:/etc/passwd:ro" \
    -v "/etc/shadow:/etc/shadow:ro" \
    -v "/etc/group:/etc/group:ro" \
    -v "$HOME/.ssh:/home/$USER/.ssh:rw" \
    -v "$currentDirectory/config/etc/hostname:/etc/hostname:ro" \
    -v "$currentDirectory/config/zsh/zshrc:/home/$USER/.zshrc:ro" \
    -v "$currentDirectory/config/zsh/oh-my-zsh:/home/$USER/.oh-my-zsh:rw" \
    -v "$currentDirectory/config/tmux/tmux.conf:/home/$USER/.tmux.conf:ro" \
    -v "$currentDirectory/config/neovim/plug.vim:/home/$USER/plug.vim:ro" \
    -v "$currentDirectory/config/neovim/plugged:/home/$USER/.config/nvim/plugged:rw" \
    -v "$currentDirectory/config/neovim/themes:/home/$USER/.config/nvim/themes:ro" \
    -v "$currentDirectory/config/neovim/init.vim:/home/$USER/.config/nvim/init.vim:ro" \
    -v "$currentDirectory/config/home/.nvm:/home/$USER/.nvm:rw" \
    -v "$workspace:/workspace:rw" \
    editor
