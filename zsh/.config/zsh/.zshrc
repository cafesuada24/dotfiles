# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from micromamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> nvm initialize >>>
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# <<< nvm initiazlize <<<

# >>> fzf intitalize >>>
[ -d /opt/fzf ] && export PATH=$PATH:/opt/fzf/bin
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

# >>> JAVA >>>
[ -d "$JAVA_HOME/bin" ] && export PATH="$JAVA_HOME/bin:$PATH"
[ -d "$MAVEN_DIR/bin" ] && export PATH="$PATH:$MAVEN_DIR/bin"
# <<< JAVA <<<

# >>> NVIM >>>
[ -d "$NVIMDIR/bin" ] && export PATH="$PATH:$NVIMDIR/bin"
if command -v nvim &>/dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    export MANPAGER='nvim +Man!'
fi
# <<< NVIM <<<

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

# SOURCING
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/binds.zsh"
