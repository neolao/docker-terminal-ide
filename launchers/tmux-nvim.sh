#!/bin/bash

HOME="/home/$USER_NAME"
SESSION="IDE"
TERM=xterm-256color

export HOME
export TERM

#lines=$(tput lines)
#cols=$(tput cols)
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

if [ ! "$TMUX_GIT_WINDOW" -eq 0 ]
then
    /tmux/tmux $options new-window -n GIT -t $SESSION:
    /tmux/tmux $options splitw -v -t $SESSION:2
    /tmux/tmux $options send-keys -t $SESSION:2.1 'gitui' Enter
    /tmux/tmux $options select-pane -t $SESSION:2.0
fi

/tmux/tmux $options select-window -t $SESSION:1.0

/tmux/tmux $options attach -t $SESSION
