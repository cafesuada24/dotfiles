#!/usr/bin/env bash

TEMPLATE_DIR=$DOTFILES/code_templates

selected_file=$(ls $TEMPLATE_DIR | fzf)

if [[ -z $selected_file ]]; then
    exit 0
fi

printf "Getting template $selected_file...\n"
cp $TEMPLATE_DIR/$selected_file $(pwd)
printf "Done."
