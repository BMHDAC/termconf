#!/bin/zsh

if [ -n "$TMUX" ]; then
  tmux popup -E $HOME/termconf/tmuxscript.sh 
else 
  $HOME/termconf/tmuxscript.sh
fi

