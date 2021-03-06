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
export NODEJS_DEFAULT_VERSION=15
export NEOVIM_PLUGIN_PHPCD=0
export NEOVIM_PLUGIN_TERN=0
export NEOVIM_PLUGIN_PRETTIER=0
export PHP_DEFAULT_VERSION=7.4.13
export PHP=0
export TYPESCRIPT=0
export DENO=0
export GO=0
export START_TMUX=0
export START_TWIN=0
export MULTIPLE=1

# MacOS
platform=$(uname)
#if [[ $platform == 'Darwin' ]]; then
#  echo "MacOS detected"
#fi


# Options
preset="default"
target="."
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Terminal IDE"
            echo "============"
            echo ""
            echo "Usage: $0 [OPTION]... [FOLDER]"
            echo "Open the IDE on a specific FOLDER. The default value is the current directory."
            echo ""
            echo "Examples:"
            echo "    $0"
            echo "    $0 /path/to/project/directory"
            echo "    $0 /path/to/file.txt"
            echo "    $0 --nodejs=8 /path/to/file.js"
            echo ""
            echo "Options:"
            echo "    --nodejs=N    Install NodeJS version N"
            echo "    --php=N       Install PHP version N"
            echo "    --typescript  Optimized for Typescript"
            echo "    --deno        Optimized for Deno"
            echo "    --go          Optimized for Go"
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

        --typescript)
            export TYPESCRIPT=1
            shift
            ;;

        --deno)
            export DENO=1
            shift
            ;;

        --go)
            export GO=1
            shift
            ;;
        --php=*)
            option=$1
            export PHP_DEFAULT_VERSION=${option:6}
            export PHP=1
            export NEOVIM_PLUGIN_PHPCD=1
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

        --preset=*)
            option=$1
            preset=${option:9}
            shift
            ;;

        *)
            target="$1"
            shift
            ;;
    esac
done

if [ "$TYPESCRIPT" -eq 1 ] && [ "$DENO" -eq 1 ]; then
    echo "You cannot enable Typescript and Deno at the same time"
    exit 1;
fi

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

# Preset
echo "Selected preset: $preset"
case $preset in
    default)
        image="neolao/ide"
        ;;

    php)
        image="neolao/ide:php"
        export NEOVIM_PLUGIN_PHPCD=1
        ;;

    *)
        echo "Invalid preset"
        exit 1
esac

touch $currentDirectory/var/gitconfig.user
touch $currentDirectory/var/gitconfig.aliases
touch $currentDirectory/var/.NERDTreeBookmarks
mkdir -p $currentDirectory/var/go

instanceCount=$(expr $(docker ps -f name=ide | wc -l) - 1)
if [ $MULTIPLE -eq 0 -a $instanceCount -gt 0 ]; then
    echo "No multiple instance"
    exit 1
fi
#instanceSuffix=$(expr $instanceCount + 1)
instanceSuffix=$(date +%s)

command="docker run --interactive --tty --rm"
command="$command --name ide-$instanceSuffix"
command="$command -e USER_NAME=$USER_NAME"
command="$command -e USER_UID=$USER_UID"
command="$command -e USER_GID=$USER_GID"
command="$command -e FILE_TO_OPEN=$FILE_TO_OPEN"
command="$command -e NODEJS_DEFAULT_VERSION=$NODEJS_DEFAULT_VERSION"
command="$command -e NEOVIM_PLUGIN_PHPCD=$NEOVIM_PLUGIN_PHPCD"
command="$command -e NEOVIM_PLUGIN_TERN=$NEOVIM_PLUGIN_TERN"
command="$command -e NEOVIM_PLUGIN_PRETTIER=$NEOVIM_PLUGIN_PRETTIER"
command="$command -e PHP_DEFAULT_VERSION=$PHP_DEFAULT_VERSION"
command="$command -e PHP=$PHP"
command="$command -e TYPESCRIPT=$TYPESCRIPT"
command="$command -e DENO=$DENO"
command="$command -e GO=$GO"
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
command="$command -v '$currentDirectory/config/home/.tern-config:/home/$USER/.tern-config:rw'"
command="$command -v '$currentDirectory/setups:/setups:ro'"
command="$command -v '$currentDirectory/launchers:/launchers:ro'"
command="$command -v '$currentDirectory/config/git/gitconfig:/home/$USER/.gitconfig:ro'"
command="$command -v '$currentDirectory/config/git/config:/git/config:ro'"
command="$command -v '$currentDirectory/config/git/commands:/git/commands:ro'"
command="$command -v '$currentDirectory/config/git/tools/diff-so-fancy:/usr/local/bin/diff-so-fancy:ro'"
command="$command -v '$currentDirectory/config/git/grv:/home/$USER/.config/grv:ro'"
command="$command -v '$currentDirectory/config/etc/hostname:/etc/hostname:ro'"
command="$command -v '$currentDirectory/config/zsh/.zsh:/home/$USER/.zsh:ro'"
command="$command -v '$currentDirectory/config/zsh/zshrc:/home/$USER/.zshrc:ro'"
command="$command -v '$currentDirectory/config/zsh/oh-my-zsh:/home/$USER/.oh-my-zsh-mounted:rw'"
command="$command -v '$currentDirectory/config/zsh/oh-my-zsh-custom:/home/$USER/.oh-my-zsh-custom:rw'"
command="$command -v '$currentDirectory/config/tmux/tmux.conf:/home/$USER/.tmux.conf:ro'"
command="$command -v '$currentDirectory/config/twin/twinrc2:/home/$USER/.twinrc:ro'"
command="$command -v '$currentDirectory/config/neovim/plug.vim:/home/$USER/plug.vim:ro'"
command="$command -v '$currentDirectory/config/neovim/plugged:/home/$USER/.config/nvim/plugged:rw'"
command="$command -v '$currentDirectory/config/neovim/coc:/home/$USER/.config/coc:rw'"
command="$command -v '$currentDirectory/config/neovim/themes:/home/$USER/.config/nvim/themes:ro'"
command="$command -v '$currentDirectory/config/neovim/init:/home/$USER/.config/nvim/init:ro'"
command="$command -v '$currentDirectory/config/neovim/init/coc/coc-settings.json:/home/$USER/.config/nvim/coc-settings.json:rw'"
command="$command -v '$currentDirectory/config/neovim/init.vim:/home/$USER/.config/nvim/init.vim:ro'"
command="$command -v '$currentDirectory/config/neovim/ftplugin:/home/$USER/.config/nvim/ftplugin:ro'"
command="$command -v '$currentDirectory/config/neovim/after:/home/$USER/.config/nvim/after:ro'"
command="$command -v '$currentDirectory/config/neovim/syntax:/home/$USER/.config/nvim/syntax:ro'"
command="$command -v '$currentDirectory/config/neovim/rplugin.vim:/home/$USER/.local/share/nvim/rplugin.vim:rw'"
command="$command -v '$currentDirectory/config/neovim/snippets:/home/$USER/.snippets:rw'"
command="$command -v '$currentDirectory/config/neovim/snippets:/home/$USER/.vim/UltiSnips:rw'"
command="$command -v '$currentDirectory/var/.vim-backup:/home/$USER/.vim-backup:rw'"
command="$command -v '$currentDirectory/var/.vim-swap:/home/$USER/.vim-swap:rw'"
command="$command -v '$currentDirectory/var/.vim-undo:/home/$USER/.vim-undo:rw'"
command="$command -v '$currentDirectory/config/home/.nvm:/home/$USER/.nvm:rw'"
command="$command -v '$currentDirectory/config/home/.phpenv:/home/$USER/.phpenv:rw'"
command="$command -v '$currentDirectory/applications:/applications:rw'"
command="$command -v '$currentDirectory/bin/gitui:/usr/local/bin/gitui:ro'"
command="$command -v '$currentDirectory/bin/composer.phar:/usr/local/bin/composer:rw'"
command="$command -v '$currentDirectory/bin/php-cs-fixer.phar:/usr/local/bin/php-cs-fixer:rw'"
command="$command -v '$currentDirectory/bin/terminal-colors.py:/usr/local/bin/terminal-colors:ro'"
command="$command -v '$currentDirectory/var/gitconfig.user:/var/ide/git/user:ro'"
command="$command -v '$currentDirectory/var/gitconfig.aliases:/var/ide/git/aliases:ro'"
command="$command -v '$currentDirectory/var/.npm:/home/$USER/.npm:rw'"
command="$command -v '$currentDirectory/var/.cache:/home/$USER/.cache:rw'"
command="$command -v '$currentDirectory/var/.NERDTreeBookmarks:/home/$USER/.NERDTreeBookmarks:rw'"
command="$command -v '$currentDirectory/var/go:/go:rw'"
command="$command -v '$currentDirectory/bin/deno:/usr/local/bin/deno:rw'"
command="$command -v '/:/disk:ro'"
command="$command -v '$WORKSPACE:/workspace:rw'"
command="$command $image"

echo -e "\033[41;37m      START IDE      \033[0m"
eval $command


