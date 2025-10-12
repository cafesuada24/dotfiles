#!/usr/bin/env bash

tmux neww -n "cli"
tmux neww -n "git" 'lazygit'
tmux select-window -t 1
