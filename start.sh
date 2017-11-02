#!/bin/bash

currentDirectory=$(dirname $0)
currentDirectory=$(realpath $currentDirectory)

GID=$(id -g)
export UID
export GID

workspace=$(realpath $1)

docker-compose run \
    -v "/etc/passwd:/etc/passwd:ro" \
    -v "/etc/shadow:/etc/shadow:ro" \
    -v "/etc/group:/etc/group:ro" \
    -v "$currentDirectory/config/etc/sudoers.d:/etc/sudoers.d:ro" \
    -v "$currentDirectory/config/etc/hostname:/etc/hostname:ro" \
    -v "$currentDirectory/config/zsh/.zshrc:/user/.zshrc:ro" \
    -v "$currentDirectory/config/zsh/oh-my-zsh:/user/.oh-my-zsh:rw" \
    -v "$currentDirectory/config/tmux/.tmux.conf:/user/.tmux.conf:ro" \
    -v "$currentDirectory/config/neovim/plug.vim:/user/plug.vim:ro" \
    -v "$currentDirectory/config/neovim/plugged:/user/.config/nvim/plugged:rw" \
    -v "$currentDirectory/config/neovim/themes:/user/.config/nvim/themes:ro" \
    -v "$currentDirectory/config/neovim/init.vim:/user/.config/nvim/init.vim:ro" \
    -v "$currentDirectory/config/home/.nvm:/user/.nvm:rw" \
    -v "$workspace:/workspace:rw" \
    editor
