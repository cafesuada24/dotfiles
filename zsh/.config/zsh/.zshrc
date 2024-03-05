#!/usr/bin/env zsh

# Options
setopt autocd
setopt extendedglob
setopt interactivecomments
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify

unsetopt BEEP

# enable completion features
zmodload zsh/complist
autoload -Uz compinit
# zstyle '*:compinit' arguments -D -i -u -C -w
rm -rf $XDG_CACHE_HOME/zsh/.zcompdump
compinit -d $XDG_CACHE_HOME/zsh/.zcompdump

_comp_options+=(globdots)

# force zsh to show the complete history
alias history="history 0"

# Source exports
source "$ZDOTDIR/exports.zsh"

# Source plugins
source "$ZDOTDIR/plugins/plugins.zsh"

# Source binds
source "$ZDOTDIR/binds.zsh"

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

