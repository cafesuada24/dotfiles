# Typewritten prompt
fpath+="$ZDOTDIR/plugins/typewritten"
autoload -U promptinit; promptinit
prompt typewritten
# -------------

# Others
[[ -f "$ZDOTDIR/plugins/web-search/web-search.zsh" ]] && source "$ZDOTDIR/plugins/web-search/web-search.zsh"
[[ -f "$ZDOTDIR/plugins/zsh-git/git.zsh" ]] && source "$ZDOTDIR/plugins/zsh-git/git.zsh"
[[ -f "$ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh" ]] && source "$ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
[[ -f "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ]] && source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
[[ -f "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh" ]] && source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
