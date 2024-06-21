eval "$(/opt/homebrew/bin/brew shellenv)"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# zsh config dir
export ZDOTDIR=$HOME/.config/zsh

#Special keys
bindkey -s ^a "~/.config/scripts/tmux-sessionizer\n"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :