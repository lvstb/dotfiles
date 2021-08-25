

<p align="center" style="text-align:center;">
  <img src="img/dot.png" width="500" />
  </p>

These are my personal dotfiles.  

## Install Dotfiles

To install these dotfiles, clone the repo.
After that just run the bootstrap script.

If the bootstrap script is done, go in VIM and do :PlugInstall! to install all vim plugins.  

## Features

- Brewfile, depending on the os (mac/linux) it will install packages listed in the brewfile.
- Zsh and oh-my-zsh config and tweaks
- Tmux with personalization
- Vim with plugins and personalization

Theme  = Nord   
Prompt = Pure

To get Python 3.7 working on Apple silicon

```bash
# Install x86 brew
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
alias ibrew=/usr/local/bin/brew

# Install Python 3.7
ibrew install python@3.7

# Add `python` executable (symlink to `python3`)
ln -s python3 "$(ibrew --prefix python@3.7)"/bin/python

# Symlink x86 Python 3.7 into pyenv
ln -s "$(ibrew --prefix python@3.7)" .pyenv/versions/3.7.10

# Check
pyenv local 3.7.10
python -V
# Python 3.7.10
python -c 'import _ctypes'. # works!

```

```bash
# This should get you going #
bash dotfiles/bootstrap.sh

```
