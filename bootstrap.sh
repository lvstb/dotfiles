#!/bin/bash
shopt -s dotglob

DOTFILES_DIR=`dirname $0`
echo $DOTFILES_DIR

# Detect OS ---------------------------------------------------------{{{
if [[ "$OSTYPE" == "darwin"* ]]; then
    DISTRO= mac
else
    DISTRO=$(for f in $(find /etc -type f -maxdepth 1 \( ! -wholename /etc/os-release ! -wholename /etc/lsb-release -wholename /etc/\*release -o -wholename /etc/\*version \) 2> /dev/null); do echo ${f:5:${#f}-13}; done)
fi

case "$DISTRO" in
    debian)
        PACKAGEMANGER="apt-get"
        func_apt-get
        ;;
    centos)
	sudo yum install epel-release -y	
	sudo yum update -y	
	curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
	sudo xargs yum -y install < ~/dotfiles/applist
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
#npm install --global pure-prompt
sudo pip3 install powerline-status pipenv --user --upgrade
sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
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
wget https://raw.githubusercontent.com/dmerewsky/zsh-pure-prompt/master/pure.zsh
ln -sf pure.zsh ~/.local/share/zsh/pure-prompt/prompt_pure_setup
https://raw.githubusercontent.com/dmerewsky/zsh-pure-prompt/master/async.zsh
ln -sf async.zsh ~/.local/share/zsh/pure-prompt/async

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
