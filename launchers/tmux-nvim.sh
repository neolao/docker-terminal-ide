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

echo "Starting TMUX ..."
sleep 1
options="-2 -S /tmp/tmux.pid -f $HOME/.tmux.conf"
/tmux/tmux $options new-session -d -s $SESSION
if [ "$FILE_TO_OPEN" == "" ]
then
    /tmux/tmux $options new-window -t $SESSION:1 -k -n EDITOR "source ~/.zshrc 2> /dev/null && cd /workspace && nvim"
else
    /tmux/tmux $options new-window -t $SESSION:1 -k -n EDITOR "cd /workspace && nvim $FILE_TO_OPEN"
fi
/tmux/tmux $options attach -t $SESSION
