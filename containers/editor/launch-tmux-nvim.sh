#!/bin/bash

HOME="/home/$USER_NAME"
SESSION="IDE"
TERM=xterm-256color

export HOME
export TERM

/tmux/tmux -2 -f $HOME/.tmux.conf new-session -d -s $SESSION
/tmux/tmux new-window -t $SESSION:1 -k -n EDITOR 'cd /workspace && nvim'
/tmux/tmux attach -t $SESSION
