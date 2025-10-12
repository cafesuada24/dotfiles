#!/usr/bin/env bash

WORKSPACES=(
  "$HOME/Projects"
  "$HOME/Playground"
  "$HOME/source_code"
  "$HOME/ros_workspaces"
)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find "${WORKSPACES[@]}"  -mindepth 1 -maxdepth 1 -type d \
      | sed "s|^$HOME/||" \
      | fzf --color='bw' --margin 10%)
    [[ $selected ]] && selected="$HOME/$selected"
fi

[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
    tmux select-window -t "$selected_name:1"
fi

tmux switch-client -t $selected_name

tmux send-keys -t "$selected_name:1" "[[ -f ./setup-workspace.bash ]] && source ./setup-workspace.bash" Enter
