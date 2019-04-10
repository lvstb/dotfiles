#!/bin/bash
shopt -s dotglob

DOTFILES_DIR=`dirname $0`
echo $DOTFILES_DIR

# Detect OS ---------------------------------------------------------{{{
##if [[ "$OSTYPE" == "darwin"* ]]; then
#    DISTRO= mac
#else
##    DISTRO=$(for f in $(find /etc -type f -maxdepth 1 \( ! -wholename /etc/os-release ! -wholename /etc/lsb-release -wholename /etc/\*release -o -wholename /etc/\*version \) 2> /dev/null); do echo ${f:5:${#f}-13}; done)
##fi
#    DISTRO= mac
#case "$DISTRO" in
#    debian)
#        sudo apt -y update && sudo apt -y upgrade
#        sudo xargs apt -y install < ~/dotfiles/applist
#        wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb && sudo dpkg -i bat_0.10.0_amd64.deb:wq
#        #Install kubernetes-cli
#        sudo apt-get update && sudo apt-get install -y apt-transport-https
#        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
#        sudo apt-get update
#        sudo apt-get install -y kubectl
#        #install kubernetes-helm
#        sudo snap install helm --classic
#	    sudo snap install ripgrep --classic
#        ;;
#    mac)

brew bundle $DOTFILES_DIR/brewfile
        #ln -s $DOTFILES_DIR/atom ~/.atom
        #apm install --packages-file ~/.atom/package.list
        #;;
#    *)
#        echo "ERROR: Your Distribution is not supported by this installation script! Please use a supported distribution"
#        exit 2
#        ;;
#esac

# }}}

# Install utils -----------------------------------------------------{{{
sudo pip install powerline-status pipenv --user --upgrade
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
# }}}

# Symlink dotfiles --------------------------------------------------{{{

ln -sf $DOTFILES_DIR/gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/gitignore ~/.gitignore
ln -sf $DOTFILES_DIR/vim ~/.vim
ln -sf $DOTFILES_DIR/tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/xterm-256color-italic.terminfo ~/xterm-256color-italic.terminfo
ln -sf $DOTFILES_DIR/tmux.terminfo ~/tmux.terminfo
ln -sf $DOTFILES_DIR/vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/vim ~/
ln -sf $DOTFILES_DIR/config ~/.config
ln -sf $DOTFILES_DIR/zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/zsh_alias ~/.zsh_alias
ln -sf $DOTFILES_DIR/zsh_functions ~/.zsh_functions
ln -sf $DOTFILES_DIR/oh-my-zsh ~/

# }}}


# change prompt --------------------------------------------------{{{
mkdir -p ~/.oh-my-zsh/functions

wget https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh
wget https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh

mv pure.zsh ~/.oh-my-zsh/functions/prompt_pure_setup
mv async.zsh ~/.oh-my-zsh/functions/async

# }}}


# change shell to zsh --------------------------------------------------{{{
chsh -s $(which zsh)
# }}}

# Install Plug for all vim plugins--------------------------------------{{{
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  echo "Installing Plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
# }}}

source $HOME/.zshrc
