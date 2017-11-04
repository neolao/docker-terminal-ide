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

echo "Setup ..."
/setups/auto.sh

echo "Starting TMUX ..."
sleep 1
/tmux/tmux -2 -f $HOME/.tmux.conf new-session -d -s $SESSION
if [ "$FILE_TO_OPEN" == "" ]
then
    /tmux/tmux new-window -t $SESSION:1 -k -n EDITOR "cd /workspace && nvim"
else
    /tmux/tmux new-window -t $SESSION:1 -k -n EDITOR "cd /workspace && nvim $FILE_TO_OPEN"
fi
/tmux/tmux attach -t $SESSION
