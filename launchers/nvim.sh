#!/bin/bash

HOME="/home/$USER_NAME"
TERM="screen-256color"

export HOME
export TERM

/setups/auto.sh

cd /workspace
if [ "$FILE_TO_OPEN" == "" ]
then
    nvim
else
    nvim $FILE_TO_OPEN
fi
