#!/bin/bash

realpathBinary=$(which realpath)
if [ ! -x $realpathBinary ] || [ "$realpathBinary" == "" ]
then
    realpathBinary=$(dirname $0)/applications/realpath/realpath
fi

scriptPath=$($realpathBinary $0)
currentDirectory=$(dirname $scriptPath)

# Default parameters
export USER_NAME=$USER
export USER_UID=$(id -u)
export USER_GID=$(id -g)
export LAUNCHER=/launchers/nvim.sh
export SERVICE_SMARTGIT=0
export FILE_TO_OPEN=""
export WORKSPACE=$(pwd)
export NODEJS_DEFAULT_VERSION=0
export NEOVIM_PLUGIN_PHPCD=0
export NEOVIM_PLUGIN_TERN=0
export NEOVIM_PLUGIN_PRETTIER=0
export START_TMUX=0
export START_TWIN=0
export MULTIPLE=1

# MacOS
platform=$(uname)
if [[ $platform == 'Darwin' ]]; then
  echo "MacOS detected"
fi


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
            export NEOVIM_PLUGIN_PRETTIER=1
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
    export WORKSPACE=$($realpathBinary $target)
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
touch $currentDirectory/var/.NERDTreeBookmarks

command="docker-compose run --rm"
command="$command -e USER_NAME=$USER_NAME"
command="$command -e USER_UID=$USER_UID"
command="$command -e USER_GID=$USER_GID"
command="$command -e FILE_TO_OPEN=$FILE_TO_OPEN"
command="$command -e NODEJS_DEFAULT_VERSION=$NODEJS_DEFAULT_VERSION"
command="$command -e NEOVIM_PLUGIN_PHPCD=$NEOVIM_PLUGIN_PHPCD"
command="$command -e NEOVIM_PLUGIN_TERN=$NEOVIM_PLUGIN_TERN"
command="$command -e NEOVIM_PLUGIN_PRETTIER=$NEOVIM_PLUGIN_PRETTIER"
command="$command -e TMUX=$TMUX"
command="$command -e LAUNCHER=$LAUNCHER"
#command="$command -v '/etc/passwd:/etc/passwd:ro'"
#command="$command -v '/etc/shadow:/etc/shadow:ro'"
#command="$command -v '/etc/group:/etc/group:ro'"
if [ -d $HOME/.ssh ]; then
    command="$command -v '$HOME/.ssh:/home/$USER/.ssh:rw'"
fi
if [ -f $HOME/.npmrc ]; then
    command="$command -v '$HOME/.npmrc:/home/$USER/.npmrc:rw'"
else
    if [ -f $currentDirectory/var/npmrc ]; then
        command="$command -v '$currentDirectory/var/npmrc:/home/$USER/.npmrc:rw'"
    fi
fi
command="$command -v '$currentDirectory/config/home/help.md:/home/$USER/help.md:ro'"
command="$command -v '$currentDirectory/config/home/.fzf.zsh:/home/$USER/.fzf.zsh:ro'"
command="$command -v '$currentDirectory/config/home/.Xdefaults:/home/$USER/.Xdefaults:ro'"
command="$command -v '$currentDirectory/setups:/setups:ro'"
command="$command -v '$currentDirectory/launchers:/launchers:ro'"
command="$command -v '$currentDirectory/config/git/gitconfig:/home/$USER/.gitconfig:ro'"
command="$command -v '$currentDirectory/config/git/config:/git/config:ro'"
command="$command -v '$currentDirectory/config/git/commands:/git/commands:ro'"
command="$command -v '$currentDirectory/config/etc/hostname:/etc/hostname:ro'"
command="$command -v '$currentDirectory/config/zsh/zshrc:/home/$USER/.zshrc:ro'"
command="$command -v '$currentDirectory/config/zsh/oh-my-zsh:/home/$USER/.oh-my-zsh:rw'"
command="$command -v '$currentDirectory/config/zsh/oh-my-zsh-custom:/home/$USER/.oh-my-zsh-custom:rw'"
command="$command -v '$currentDirectory/config/tmux/tmux.conf:/home/$USER/.tmux.conf:ro'"
command="$command -v '$currentDirectory/config/twin/twinrc2:/home/$USER/.twinrc:ro'"
command="$command -v '$currentDirectory/config/neovim/plug.vim:/home/$USER/plug.vim:ro'"
command="$command -v '$currentDirectory/config/neovim/plugged:/home/$USER/.config/nvim/plugged:rw'"
command="$command -v '$currentDirectory/config/neovim/themes:/home/$USER/.config/nvim/themes:ro'"
command="$command -v '$currentDirectory/config/neovim/init:/home/$USER/.config/nvim/init:ro'"
command="$command -v '$currentDirectory/config/neovim/init.vim:/home/$USER/.config/nvim/init.vim:ro'"
command="$command -v '$currentDirectory/config/neovim/rplugin.vim:/home/$USER/.local/share/nvim/rplugin.vim:rw'"
command="$command -v '$currentDirectory/config/neovim/snippets:/home/$USER/.snippets:rw'"
command="$command -v '$currentDirectory/config/neovim/snippets:/home/$USER/.vim/UltiSnips:rw'"
command="$command -v '$currentDirectory/config/home/.nvm:/home/$USER/.nvm:rw'"
command="$command -v '$currentDirectory/applications:/applications:rw'"
command="$command -v '$currentDirectory/bin/composer.phar:/usr/local/bin/composer:rw'"
command="$command -v '$currentDirectory/bin/terminal-colors.py:/usr/local/bin/terminal-colors:ro'"
command="$command -v '$currentDirectory/var/gitconfig.user:/var/ide/git/user:ro'"
command="$command -v '$currentDirectory/var/gitconfig.aliases:/var/ide/git/aliases:ro'"
command="$command -v '$currentDirectory/var/.npm:/home/$USER/.npm:rw'"
command="$command -v '$currentDirectory/var/.cache:/home/$USER/.cache:rw'"
command="$command -v '$currentDirectory/var/.NERDTreeBookmarks:/home/$USER/.NERDTreeBookmarks:rw'"
command="$command -v '/:/disk:ro'"
command="$command -v '$WORKSPACE:/workspace:rw'"
command="$command $service"

echo -e "\033[41;37m      START IDE      \033[0m"
eval $command

if [ "$MULTIPLE" -eq 0 ]
then
    docker-compose down
fi

