set nocompatible              " be iMproved, required filetype off                  " required


call plug#begin()
Plug 'tpope/vim-commentary'                             "Comment out stuff with a simple keycombination
Plug 'nvim-lua/plenary.nvim'
"Plug 'tpope/vim-repeat'
"Plug 'itchyny/lightline.vim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'p00f/nvim-ts-rainbow'
"Plug 'elzr/vim-json'
Plug 'SmiteshP/nvim-gps'
Plug 'airblade/vim-gitgutter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'mhinz/vim-signify'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
"Plug 'mfussenegger/nvim-lint'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/lspsaga.nvim'
Plug 'glepnir/dashboard-nvim'
"Plug 'mbbill/undotree'
Plug 'folke/trouble.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'arcticicestudio/nord-vim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" Example config in Vim-Scriptj
"let g:nord_contrast = v:true
""let g:nord_borders = v:false
""let g:nord_disable_background = v:true
"let g:nord_italic = v:false
"let g:indent_blankline_show_trailing_blankline_indent = v:false

" syntax on
set termguicolors
" colorscheme nord

"source $HOME/.config/nvim/config/general.vimrc
"source $HOME/.config/nvim/config/init.vimrc
"source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/keymaps.vimrc
"source $HOME/.config/nvim/config/line.vimrc

"Include lua config
:lua require'init'
