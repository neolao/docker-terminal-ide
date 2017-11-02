#!/bin/bash


HOME=/user
SESSION="IDE"
TERM=xterm-256color

export HOME
export TERM

/tmux/tmux -2 -f /user/.tmux.conf new-session -d -s $SESSION
/tmux/tmux new-window -t $SESSION:1 -k -n EDITOR 'cd /workspace && nvim'
/tmux/tmux attach -t $SESSION
