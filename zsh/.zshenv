#!/usr/bin/env zsh

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export PATH="$HOME/.local/bin":$PATH

# ZSH
export HISTFILE="$XDG_CONFIG_HOME/.zhistory"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Other softwares
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
export JAVA_HOME="$HOME/.env/java/jre1.8.0_401/"

# 
export KEYTIMEOUT=1


################
#              #
# Call modules #
#              #
################

eval "$(~/.rbenv/bin/rbenv init - zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

