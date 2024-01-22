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
