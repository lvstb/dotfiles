#!/bin/bash
shopt -s dotglob

DOTFILES_DIR=`dirname $0`
echo $DOTFILES_DIR

brew bundle --file=$DOTFILES_DIR/brewfile

# Install utils -----------------------------------------------------{{{
sudo pip install powerline-status pipenv --user --upgrade
sudo pip install jedi --user --upgrade

sudo git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g' | sed 's:chsh -s .*$::g')"
# }}}

# Symlink dotfiles --------------------------------------------------{{{

ln -sf $DOTFILES_DIR/gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/gitignore ~/.gitignore_global
ln -sf $DOTFILES_DIR/tmux.conf ~/.tmux.conf
ln -sf $DOTFILES_DIR/xterm-256color-italic.terminfo ~/xterm-256color-italic.terminfo
ln -sf $DOTFILES_DIR/tmux.terminfo ~/tmux.terminfo
ln -sf $DOTFILES_DIR/config ~/.config
ln -sf $DOTFILES_DIR/zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/zsh_alias ~/.zsh_alias
ln -sf $DOTFILES_DIR/zsh_functions ~/.zsh_functions
ln -sf $DOTFILES_DIR/oh-my-zsh ~/

# }}}


# change prompt --------------------------------------------------{{{
# mkdir -p ~/.oh-my-zsh/functions

# wget https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh
# wget https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh

# mv pure.zsh ~/.oh-my-zsh/functions/prompt_pure_setup
# mv async.zsh ~/.oh-my-zsh/functions/async

# }}}


# change shell to zsh --------------------------------------------------{{{
chsh -s $(which zsh)
# }}}

# Install Plug for all vim plugins--------------------------------------{{{
# if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
#   echo "Installing Plug"
#   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# fi
# }}}

source $HOME/.zshrc
