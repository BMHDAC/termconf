#!/bin/zsh

if [ -n "$TMUX" ]; then
  tmux popup -d -E zsh -c $HOME/termconf/tmuxscript.sh
else 
  ./tmuxscript.sh
fi

