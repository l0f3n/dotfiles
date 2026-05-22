#!/bin/bash

DIR="$HOME/git/dotfiles"

SESSION=$(tmux new-session -d -c $DIR -P -F '#{session_name}')

# Split vertically - creates right pane
tmux split-window -h -t $SESSION -c $DIR

# Split right pane horizontally - bottom terminal takes 20%
tmux split-window -v -t $SESSION:1.2 -p 20 -c $DIR

# Top-right: nvim with neotree
tmux send-keys -t $SESSION:1.2 "nvim -c 'Neotree reveal'" Enter

# Left: claude
tmux send-keys -t $SESSION:1.1 "claude" Enter

# Focus left pane
tmux select-pane -t $SESSION:1.1

tmux attach-session -t $SESSION
