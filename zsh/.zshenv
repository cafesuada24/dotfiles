#!/usr/bin/env zsh

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.local/bin":$PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# ZSH
export HISTFILE="$XDG_CONFIG_HOME/.zhistory"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Other softwares
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
# export JAVA_HOME="$HOME/.env/java/jre1.8.0_401/"

# 
export KEYTIMEOUT=1


################
#              #
# Call modules #
#              #
################

# eval "$(~/.rbenv/bin/rbenv init - zsh)"


