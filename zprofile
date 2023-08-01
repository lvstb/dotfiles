eval "$(/opt/homebrew/bin/brew shellenv)"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,hl:#81a1c1
    --color=fg+:#e5e9f0,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
    --height 60%'


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
export PATH="/Library/Java/JavaVirtualMachines/graalvm-ce-java11-22.3.1/Contents/Home/bin:$PATH"
export GRAALVM_HOME="/Users/lvansteenbergen/.sdkman/candidates/java/22.3.r19-grl"
export JAVA_HOME="/Users/lvansteenbergen/.sdkman/candidates/java/22.3.r19-grl"

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

#ZCLI
export AWS_CA_BUNDLE=/opt/homebrew/etc/ca-certificates/cert.pem;
export NODE_EXTRA_CA_CERTS=/Users/lvansteenbergen/.zcli/zscaler_root.pem;