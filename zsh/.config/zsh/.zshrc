# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/serein/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/serein/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/serein/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/serein/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/serein/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/serein/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

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
[ -d "/usr/local/java/jdk-23-oracle-x64" ] && export PATH="$JAVA_HOME/bin:$PATH"
[ -d /opt/apache-maven/bin ] && export PATH=$PATH:/opt/apache-maven/bin
# <<< JAVA <<<

# >>> NVIM >>>
[ -d /opt/nvim-linux64/bin ] && export PATH="$PATH:/opt/nvim-linux64/bin"
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

# SOURCING
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/binds.zsh"
