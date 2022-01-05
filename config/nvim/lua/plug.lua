-- https://github.com/wbthomason/packer.nvim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'tpope/vim-commentary'
    use 'nvim-lua/plenary.nvim'
    use {'glepnir/galaxyline.nvim', branch = 'main'}
    use 'p00f/nvim-ts-rainbow'
    use 'SmiteshP/nvim-gps'
    use 'airblade/vim-gitgutter'
    use 'norcalli/nvim-colorizer.lua'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'kabouzeid/nvim-lspinstall'
    use 'kyazdani42/nvim-web-devicons'
    use 'glepnir/lspsaga.nvim'
    use 'glepnir/dashboard-nvim'
    use 'folke/trouble.nvim'
    use {'nvim-telescope/telescope-fzy-native.nvim'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'folke/lsp-colors.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'tpope/vim-fugitive'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'windwp/nvim-autopairs'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }
    use 'arcticicestudio/nord-vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
