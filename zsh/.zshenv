#!/usr/bin/env zsh


export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CONFIG_HOME/.zhistory"
export HISTSIZE=10000
export HISTSAVE=10000

# Other softwares
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# Man pages
export MANPAGER='nvim +Man!'

# PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# export JAVA_HOME="$HOME/.env/java/jre1.8.0_401/"

# 
export KEYTIMEOUT=1


################
#              #
# Call modules #
#              #
################
