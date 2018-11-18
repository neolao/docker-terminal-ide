#!/bin/bash

HOME="/home/$USER_NAME"
SESSION="IDE"
TERM=xterm-256color

export HOME
export TERM

lines=$(tput lines)
cols=$(tput cols)
#stty rows $lines
#stty cols $cols

/setups/auto.sh

echo "Starting TWIN ..."
sleep 1
twin --hw=tty
