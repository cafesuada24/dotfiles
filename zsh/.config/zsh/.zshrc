# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
if [[ -x "$MAMBA_EXE" ]]; then
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
    fi
    unset __mamba_setup
fi
# <<< mamba initialize <<<

# >>> nvm initialize >>>
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# <<< nvm initiazlize <<<

# >>> fzf intitalize >>>
if [ -d "$FZF_DIR" ]; then
    export PATH=$PATH:$FZF_DIR/bin
    source $FZF_DIR/shell/key-bindings.zsh
    source $FZF_DIR/shell/completion.zsh
fi
# <<< fzf initialize <<<

# >>> starship init >>>
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi
# <<< starship init >>>

# >>> TMUX >>>
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  # tmux attach-session -t default || tmux new-session -s default
  tmux new-session
fi
# <<< TMUX <<<

# >>> FZF >>>
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
# <<< FZF <<<

# >>> Ripgrep >>> 
if command -v rg &>/dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
fi
# <<< Ripgrep <<<

# >>> Android Studio >>>
[ -d "$ANDROID_HOME" ] && export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"
# <<< Android Studio <<<

# >>> Lazygit >>>
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
# <<< Lazygit <<<

# <<< Google Cloud <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/serein/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/serein/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/serein/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/serein/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# SOURCING
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/binds.zsh"
