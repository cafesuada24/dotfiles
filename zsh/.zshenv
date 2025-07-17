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

# NVIM
export NVIMDIR="/opt/nvim-linux64"
export NVIMCONFIG="$XDG_CONFIG_HOME/nvim"
export NVIMDATA="$XDG_DATA_HOME/nvim"

# NVM (Node version manager)
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# Starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

# Micromamba
export MAMBA_EXE="/opt/micromamba/bin/micromamba"
export MAMBA_ROOT_PREFIX="$HOME/micromamba"

# JAVA SDK
export JAVA_HOME="/usr/local/java/jdk-23-oracle-x64"
export MAVEN_DIR="/opt/apache-maven"

# Android Studio
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# # Culbas
# export CUBLAS_WORKSPACE_CONFIG=:16:8
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
