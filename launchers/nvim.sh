#!/bin/bash

HOME="/home/$USER_NAME"
TERM="screen-256color"

export HOME
export TERM

echo "Setup ..."
/setups/auto.sh

cd /workspace
zsh
exit 0
if [ "$FILE_TO_OPEN" == "" ]
then
    zsh -c nvim
else
    zsh -c nvim $FILE_TO_OPEN
fi
