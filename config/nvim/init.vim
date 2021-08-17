set nocompatible              " be iMproved, required
filetype off                  " required


call plug#begin()
Plug 'tpope/vim-commentary'                             "Comment out stuff with a simple keycombination
"Plug 'tpope/vim-repeat'
"Plug 'itchyny/lightline.vim'
"Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'shaunsingh/nord.nvim'
"Plug 'https://github.com/m-kat/aws-vim'
"Plug 'tpope/vim-fugitive'
"Plug 'hashivim/vim-terraform'
"Plug 'pearofducks/ansible-vim'
" Plug 'bling/vim-bufferline'
"Plug 'ap/vim-buftabline'
"Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'alecthomas/gometalinter'
" Color schemes
"Plug 'chriskempson/base16-vim'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
"Plug 'arcticicestudio/nord-vim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" Example config in Vim-Script
let g:nord_contrast = v:true
let g:nord_borders = v:false
let g:nord_disable_background = v:true
let g:nord_italic = v:false

"Vim-Script:
colorscheme nord

source $HOME/.config/nvim/config/general.vimrc

"source $HOME/.config/nvim/config/init.vimrc
source $HOME/.config/nvim/config/plugins.vimrc
"source $HOME/.config/nvim/config/keys.vimrc
"source $HOME/.config/nvim/config/line.vimrc

"Include lua config
:lua require'init'
