#!/bin/zsh

# Use fzf to find a directory in $HOME/Projects with a maximum depth of 3
DIR=$(fd -d 3 -t d --hidden --exclude=.git --exclude=node_modules --exclude=.cache . "$HOME" | fzf)

# If no directory was selected, exit
if [ -z "$DIR" ]; then
  exit 0
fi

# Get the directory name
SESSION_NAME=$(basename "$DIR")

# Check if a tmux session with the same name already exists
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  # If the session exists, switch to it
  if [ -n "$TMUX" ]; then
    # If we're already in a tmux session, switch to the existing session
    tmux switch-client -t "$SESSION_NAME"
  else
    # If we're not in a tmux session, attach to the existing session
    tmux attach-session -t "$SESSION_NAME"
  fi
else
  # If the session doesn't exist, create a new one
  if [ -n "$TMUX" ]; then
    # If we're already in a tmux session, create a new session and switch to it
    tmux new-session -d -s "$SESSION_NAME" -c "$DIR"
    tmux switch-client -t "$SESSION_NAME"
  else
    # If we're not in a tmux session, create a new session and attach to it
    tmux new-session -s "$SESSION_NAME" -c "$DIR"
  fi
fi
