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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/serein/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/serein/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/serein/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/serein/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# eval "$(~/.rbenv/bin/rbenv init - zsh)"


