#!/usr/bin/env zsh

TMUX_DIR=~/.config/tmux

selected=`cat $TMUX_DIR/.tmux-cht-languages $TMUX_DIR/.tmux-cht-command | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

printf "Enter Query: "
read query

if grep -qs "$selected" $TMUX_DIR/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
