#!/bin/sh
export ZDOTDIR=$HOME/.config/zsh
# beeping is annoying
unsetopt BEEP

# Useful Functions
source "$ZDOTDIR/zsh-functions"
source "$ZDOTDIR/zsh-alias"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-completions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "Aloxaf/fzf-tab"
zsh_add_plugin "env"
# zsh_add_completion "esc/conda-zsh-completion" false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions
# Key-bindings


# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="zen-browser"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
zle_highlight+=(paste:none)
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
source "$ZDOTDIR/fzf_opts"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always $realpath'


# Shell integrations
eval "$(zoxide init --cmd cd zsh)"
#prompt theme
eval "$(starship init zsh)"

eval $(thefuck --alias fk)

#nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#direnv
eval "$(direnv hook zsh)"

autoload -Uz compinit && compinit
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"source /usr/share/nvm/init-nvm.sh
source /usr/share/nvm/init-nvm.sh