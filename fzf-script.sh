#!/bin/bash

if [ -n "$TMUX" ]; then
  tmux popup -E $HOME/termconf/tmuxscript.sh 
else 
  echo "You are not inside tmux"
fi

