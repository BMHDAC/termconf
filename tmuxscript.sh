#! /bin/sh
target=$(basename $(pwd))
tmux new -d -At $target
tmux switch-client -t $target
