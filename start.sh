#!/bin/bash

currentDirectory=$(dirname $0)
realpathBinary=$(which realpath)

if [ ! -x $realpathBinary ]
then
    realpathBinary=$currentDirectory/applications/realpath/realpath
fi

scriptPath=$($realpathBinary $0)
currentDirectory=$(dirname $scriptPath)

# Default parameters
export USER_NAME=$USER
export USER_UID=$UID
export USER_GID=$(id -g)
export LAUNCHER=/launchers/nvim.sh
export SERVICE_SMARTGIT=0
export FILE_TO_OPEN=""
export WORKSPACE=$(pwd)
export NODEJS_DEFAULT_VERSION=0
export NEOVIM_PLUGIN_PHPCD=0
export NEOVIM_PLUGIN_TERN=0
export START_TMUX=0
export START_TWIN=0
export MULTIPLE=1

# Options
target="."
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Terminal IDE"
            echo "============"
            echo ""
            echo "Usage: $0 [OPTIONS] [TARGET]"
            echo ""
            echo "Examples:"
            echo "    $0"
            echo "    $0 /path/to/project/directory"
            echo "    $0 /path/to/file.txt"
            echo "    $0 --nodejs=8 /path/to/file.js"
            echo ""
            echo "Options:"
            echo "    --nodejs=N    Install NodeJS version N"
            echo "    --smartgit    Launch SmartGit"
            echo "    --tmux        Use TMUX"
            exit 0
            ;;

        --nodejs=*)
            option=$1
            export NODEJS_DEFAULT_VERSION=${option:9}
            export NEOVIM_PLUGIN_TERN=1
            shift
            ;;

        --tmux)
            export START_TMUX=1
            export LAUNCHER=/launchers/tmux-nvim.sh
            shift
            ;;

        --twin)
            export START_TWIN=1
            export LAUNCHER=/launchers/twin.sh
            shift
            ;;

        --smartgit)
            export SERVICE_SMARTGIT=1
            shift
            ;;

        --one-instance)
            export MULTIPLE=0
            shift
            ;;

        *)
            target="$1"
            shift
            ;;
    esac
done


# Select the workspace
if [ -n "$target" ]
then
    export WORKSPACE=$(realpath $target)
fi
if [ -f $WORKSPACE ]
then
    export FILE_TO_OPEN=$WORKSPACE
    export WORKSPACE=$(dirname $WORKSPACE)
    directoryLength=${#WORKSPACE}+1
    export FILE_TO_OPEN=${FILE_TO_OPEN:$directoryLength}
fi

# Select the preset
preset="default"
if [ -n "$2" ]
then
    preset=$2
fi

# Configuration
case $preset in
    default)
        service="editor"
        ;;

    php)
        service="editor_php"
        export NEOVIM_PLUGIN_PHPCD=1
        ;;

    *)
        echo "Invalid preset"
        exit 1
esac

# Run services
cd $currentDirectory
if [ "$SERVICE_SMARTGIT" -eq 1 ]; then
    docker-compose up -d smartgit
fi

touch $currentDirectory/var/gitconfig.user
touch $currentDirectory/var/gitconfig.aliases

docker-compose run --rm \
    -e USER_NAME=$USER \
    -e USER_UID=$UID \
    -e USER_GID=$GID \
    -e FILE_TO_OPEN=$FILE_TO_OPEN \
    -e NODEJS_DEFAULT_VERSION=$NODEJS_DEFAULT_VERSION \
    -e NEOVIM_PLUGIN_PHPCD=$NEOVIM_PLUGIN_PHPCD \
    -e NEOVIM_PLUGIN_TERN=$NEOVIM_PLUGIN_TERN \
    -e TMUX=$TMUX \
    -e LAUNCHER=$LAUNCHER \
    -v "/etc/passwd:/etc/passwd:ro" \
    -v "/etc/shadow:/etc/shadow:ro" \
    -v "/etc/group:/etc/group:ro" \
    -v "$HOME/.ssh:/home/$USER/.ssh:rw" \
    -v "$currentDirectory/config/home/.Xdefaults:/home/$USER/.Xdefaults:ro" \
    -v "$currentDirectory/setups:/setups:ro" \
    -v "$currentDirectory/launchers:/launchers:ro" \
    -v "$currentDirectory/config/git/.gitconfig:/home/$USER/.gitconfig:ro" \
    -v "$currentDirectory/config/git/config:/git/config:ro" \
    -v "$currentDirectory/config/git/commands:/git/commands:ro" \
    -v "$currentDirectory/config/etc/hostname:/etc/hostname:ro" \
    -v "$currentDirectory/config/zsh/zshrc:/home/$USER/.zshrc:ro" \
    -v "$currentDirectory/config/zsh/oh-my-zsh:/home/$USER/.oh-my-zsh:rw" \
    -v "$currentDirectory/config/zsh/oh-my-zsh-custom:/home/$USER/.oh-my-zsh-custom:rw" \
    -v "$currentDirectory/config/tmux/tmux.conf:/home/$USER/.tmux.conf:ro" \
    -v "$currentDirectory/config/twin/twinrc2:/home/$USER/.twinrc:ro" \
    -v "$currentDirectory/config/neovim/plug.vim:/home/$USER/plug.vim:ro" \
    -v "$currentDirectory/config/neovim/plugged:/home/$USER/.config/nvim/plugged:rw" \
    -v "$currentDirectory/config/neovim/themes:/home/$USER/.config/nvim/themes:ro" \
    -v "$currentDirectory/config/neovim/init:/home/$USER/.config/nvim/init:ro" \
    -v "$currentDirectory/config/neovim/init.vim:/home/$USER/.config/nvim/init.vim:ro" \
    -v "$currentDirectory/config/neovim/rplugin.vim:/home/$USER/.local/share/nvim/rplugin.vim:ro" \
    -v "$currentDirectory/config/home/.nvm:/home/$USER/.nvm:rw" \
    -v "$currentDirectory/applications:/applications:rw" \
    -v "$currentDirectory/bin/composer.phar:/usr/local/bin/composer:rw" \
    -v "$currentDirectory/bin/terminal-colors.py:/usr/local/bin/terminal-colors:ro" \
    -v "$currentDirectory/var/gitconfig.user:/var/ide/git/user:ro" \
    -v "$currentDirectory/var/gitconfig.aliases:/var/ide/git/aliases:ro" \
    -v "/:/disk:ro" \
    -v "$WORKSPACE:/workspace:rw" \
    $service

if [ "$MULTIPLE" -eq 0 ]
then
    docker-compose down
fi

