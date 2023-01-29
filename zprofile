eval "$(/opt/homebrew/bin/brew shellenv)"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,hl:#81a1c1
    --color=fg+:#e5e9f0,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
    --height 60%'

# AWS SSO (DPG)
export AWS_PROFILE=default
export AWS_DEFAULT_REGION=eu-west-1
export AWS_DEFAULT_SSO_START_URL=https://d-93677093a7.awsapps.com/start
export AWS_DEFAULT_SSO_REGION=eu-west-1

# Path
export PATH="/usr/local/bin/:$PATH"
export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/bin/brew:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="~/Library/Python/3.7/bin:$PATH"
export GOPATH=~/go export
export PATH=$GOPATH/bin:$PATH
export PATH="/usr/local/opt/:$PATH"
# export PATH="/usr/local/opt/binutils/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
# export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export SHOW_AWS_PROMPT=true
export EDITOR=vim

#Special keys
bindkey -s ^a "~/.config/scripts/tmux-sessionizer\n"
#pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#zcli
export CERT_PATH=$(python -m certifi)
export SSL_CERT_FILE=${CERT_PATH}
export REQUESTS_CA_BUNDLE=${CERT_PATH}
