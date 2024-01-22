# VIM Mode
bindkey -v

###############
#             #
# Completions #
#             #
###############

# Make Ctr-j go straight to the menu
# bindkey -r '^j'
bindkey '^I' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '^I' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select

# Autosuggest accept
bindkey '^ ' autosuggest-accept

# Make Enter submit the command line straight from the menu
bindkey -M menuselect '\r' .accept-line

# Vim mapping for completions
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
