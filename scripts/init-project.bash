#!/usr/bin/env bash

SCRIPTS_DIR=$DOTFILES/scripts/init-project-langs

LANG=(
    "python"
    "cpp"
)

if [[ $# -ge 1 ]]; then
    selected=$1
else
    selected=$(printf "%s\n" "${LANG[@]}" | fzf)
fi

if [[ -z $selected ]]; then
    echo "This language is not supported"
    exit 0
fi

$SCRIPTS_DIR/${selected}.bash
