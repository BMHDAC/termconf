#! /bin/bash
target=$(basename $(pwd));
if [[ -z $TMUX ]];
then
    tmux new -At $target
else 
    tmux new -d -At $target &&
    tmux switch-client -t $target
fi
