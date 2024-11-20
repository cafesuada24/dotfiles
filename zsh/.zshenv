#!/usr/bin/env zsh


export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Editor
export EDITOR='nano'
export VISUAL='nano'

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CONFIG_HOME/.zhistory"
export HISTSIZE=10000
export HISTSAVE=10000

# Other softwares
export NVIMCONFIG="$XDG_CONFIG_HOME/nvim"
export NVIMDATA="$XDG_DATA_HOME/nvim"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# Starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

# JAVA
export JAVA_HOME="/usr/local/java/jdk-23-oracle-x64"

# FZF
# export FZF_DEFAULT_COMMAND='rg --files'

# Man pages
# export MANPAGER='nvim +Man!'

# 
export KEYTIMEOUT=1


################
#              #
# Call modules #
#              #
################
