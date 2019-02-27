#!/bin/bash
shopt -s dotglob

DOTFILES_DIR=`dirname $0`

# Detect OS ---------------------------------------------------------{{{
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO= $ID
elif [[ "$OSTYPE" == "darwin"* ]]; then
    DISTRO= mac
fi

case "$DISTRO" in
    debian)
        PACKAGEMANGER="apt-get"
        func_apt-get
        ;;
    centos)
        PACKAGEMANAGER="yum"
        func_yum
        ;;
    redhat)
        PACKAGEMANAGER="up2date"
        func_up2date
        ;;
    mac)
        func_brew
        ;;
    *)
        echo "ERROR: Your Distribution is not supported by this installation script! Please use a supported distribution"
        exit 2
        ;;
esac

# }}}

# Install Os specific packages --------------------------------------{{{
func_apt-get() {
          xargs apt-get -y install < applist
}

func_yum() {
          xargs yum -y install < applist
}

func_up2date() {
          xargs up2date -y install < applist
}

func_brew() {
          brew bundle $DOTFILES_DIR/brewfile
          ln -s $DOTFILES_DIR/atom ~/.atom
          apm install --packages-file ~/.atom/package.list
}
# }}}

# Install utils -----------------------------------------------------{{{
npm install --global pure-prompt
pip3 install powerline-status pipenv --user --upgrade
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# }}}

# Symlink dotfiles --------------------------------------------------{{{

ln -s $DOTFILES_DIR/gitconfig ~/.gitconfig
ln -s $DOTFILES_DIR/gitignore ~/.gitignore
ln -s $DOTFILES_DIR/tmux.conf ~/.tmux.conf
ln -s $DOTFILES_DIR/xterm-256color-italic.terminfo ~/xterm-256color-italic.terminfo
ln -s $DOTFILES_DIR/tmux.terminfo ~/tmux.terminfo
ln -s $DOTFILES_DIR/vimrc ~/.vimrc
ln -s $DOTFILES_DIR/vim ~/
ln -s $DOTFILES_DIR/config ~/.config
ln -s $DOTFILES_DIR/zshrc ~/.zshrc
ln -s $DOTFILES_DIR/zshrc_alias ~/.zshrc_alias
ln -s $DOTFILES_DIR/zshrc_functions ~/.zshrc_functions
ln -s $DOTFILES_DIR/.oh-my-zsh ~/

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

# source the .zshrc to apply all changes--------------------------------{{{
source $HOME/.zshrc
# }}}

echo "Successfully updated dotfiles!"
echo " "
