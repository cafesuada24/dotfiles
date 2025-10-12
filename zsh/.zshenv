export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Editor
if [[ -x "$(command -v vim)" ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
else
    export EDITOR='nano'
    export VISUAL='nano'
fi

# ZSH
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CONFIG_HOME/.zhistory"
export HISTSIZE=10000
export HISTSAVE=10000

# NVIM
export NVIMDIR='/opt/nvim-linux64'
if [[ -d "$NVIMDIR" && -d "$NVIMDIR/bin" ]]; then
    export NVIMCONFIG="$XDG_CONFIG_HOME/nvim"
    export NVIMDATA="$XDG_DATA_HOME/nvim"
    export PATH="$PATH:$NVIMDIR/bin"
else
    unset NVIMDIR
fi

if [[ -x "$(command -v nvim)" || -x "$NVIMDIR/bin/nvim" ]]; then
    export EDITOR='nvim'
    export VISUAL='nvim'
    export MANPAGER='nvim +Man!'
fi

# NVM (Node version manager)
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
if ! [[ -d "$NVM_DIR" ]]; then
    unset NVM_DIR
fi

# Starship
if [[ -x "$(command -v starship)" ]]; then
    export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
    export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"
fi

# Micromamba
export MAMBA_EXE='/opt/micromamba/bin/micromamba'
if [[ -x "$MAMBA_EXE" ]]; then
    export MAMBA_ROOT_PREFIX="$HOME/micromamba"
else
    unset MAMBA_EXE
fi

# JAVA SDK
export JAVA_HOME='/usr/local/java/jdk-23-oracle-x64'
if [[ -d "$JAVA_HOME" && -d "$JAVA_HOME/bin" ]]; then
    export PATH="$JAVA_HOME/bin:$PATH"
else
    unset JAVA_HOME
fi

export MAVEN_DIR='/opt/apache-maven'
if [[ -d "$MAVEN_DIR" && -d "$MAVEN_DIR/bin" ]]; then
    export PATH="$PATH:$MAVEN_DIR/bin"
else
    unset MAVEN_DIR
fi

# Android Studio
export ANDROID_HOME="$HOME/Android/Sdk"
if [[ -d "$ANDROID_HOME" ]]; then
    export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"
    export ANDROID_USER_HOME="$HOME/.android"
else
    unset ANDROID_HOME
fi

# FZF
export FZF_DIR='/opt/fzf'
if ! [[ -d "$FZF_DIR" ]]; then
    unset FZF_DIR
fi

# Man pages
# export MANPAGER='nvim +Man!'

# 
export KEYTIMEOUT=1
