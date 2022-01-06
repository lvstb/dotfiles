-- https://github.com/ChristianChiarulli/nvim

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print "Installing packer, close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
    use 'tpope/vim-commentary'
    use 'kyazdani42/nvim-web-devicons'
    use 'norcalli/nvim-colorizer.lua'
    use 'lukas-reineke/indent-blankline.nvim'
    use {'iamcco/markdown-preview.nvim', run = 'cd app & yarn install' }

    -- Galaxyline
    use {'glepnir/galaxyline.nvim', branch = 'main'}
    use 'SmiteshP/nvim-gps'

    -- cmp plugins
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-cmdline' -- Cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- Snippet completions

    -- colorscheme
    use 'arcticicestudio/nord-vim'

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
    use 'onsails/lspkind-nvim' -- Vscode style pictograms
    use 'folke/trouble.nvim'
    use 'folke/lsp-colors.nvim' -- creates missing LSP diagnostics highlight groups
    --use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    -- use {'filipdutescu/renamer.nvim',
    --         branch = 'master',
    --         requires = { {'nvim-lua/plenary.nvim'} }
    --     }

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzy-native.nvim'}
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'ThePrimeagen/git-worktree.nvim'

    -- Git
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
