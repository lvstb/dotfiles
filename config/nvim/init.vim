set nocompatible              " be iMproved, required filetype off                  " required


call plug#begin()
Plug 'shaunsingh/nord.nvim'
Plug 'tpope/vim-commentary'                             "Comment out stuff with a simple keycombination
"Plug 'tpope/vim-repeat'
"Plug 'itchyny/lightline.vim'
"Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
Plug 'SmiteshP/nvim-gps'
Plug 'airblade/vim-gitgutter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'hoob3rt/lualine.nvim'
"Plug 'mhinz/vim-signify'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/lspsaga.nvim'
Plug 'mbbill/undotree'
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'tpope/vim-fugitive'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" Example config in Vim-Scriptj
let g:nord_contrast = v:true
"let g:nord_borders = v:false
"let g:nord_disable_background = v:true
let g:nord_italic = v:false
let g:indent_blankline_show_trailing_blankline_indent = v:false
"Vim-Script:
"let g:nightfox_style = "palefox"
"let g:nightfox_transparent = "true"
"let g:nightfox_terminal_colors = "true"
set termguicolors
colorscheme nord

source $HOME/.config/nvim/config/general.vimrc

"source $HOME/.config/nvim/config/init.vimrc
"source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/keymaps.vimrc
"source $HOME/.config/nvim/config/line.vimrc

"Include lua config
:lua require'init'
