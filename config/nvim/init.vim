set nocompatible              " be iMproved, required filetype off                  " required


call plug#begin()
Plug 'shaunsingh/nord.nvim'
Plug 'tpope/vim-commentary'                             "Comment out stuff with a simple keycombination
Plug 'psf/black'
"Plug 'tpope/vim-repeat'
"Plug 'itchyny/lightline.vim'
"Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
"Plug 'mhinz/vim-signify'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
"Plug 'tpope/vim-fugitive'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" Example config in Vim-Scriptj
let g:nord_contrast = v:true
"let g:nord_borders = v:false
"let g:nord_disable_background = v:true
let g:nord_italic = v:false

"Vim-Script:
"let g:nightfox_style = "palefox"
"let g:nightfox_transparent = "true"
"let g:nightfox_terminal_colors = "true"
set termguicolors

"lua << EOF
"require("onedark").setup({
"  functionStyle = "italic",
"  transparent = "true",
"  sidebars = {"qf", "vista_kind", "terminal", "packer"},
"
"  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
"  colors = {hint = "orange", error = "#ff0000"}
"})
"EOF
colorscheme nord

source $HOME/.config/nvim/config/general.vimrc

"source $HOME/.config/nvim/config/init.vimrc
"source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/keymaps.vimrc
"source $HOME/.config/nvim/config/line.vimrc

"Include lua config
:lua require'init'
