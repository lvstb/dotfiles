-- https://github.com/ChristianChiarulli/nvim
-- https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    print("Installing packer, close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
    return string.format('require("plugins/%s")', name)
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
    use("tpope/vim-commentary")
    use({ "kyazdani42/nvim-web-devicons", config = get_setup("web-devicons") })
    use({ "norcalli/nvim-colorizer.lua", config = get_setup("colorizer"), event = "BufReadPre" })
    use({ "lukas-reineke/indent-blankline.nvim", config = get_setup("indent-blankline") })
    use({ "ellisonleao/glow.nvim" })
    use({ "akinsho/toggleterm.nvim", tag = "*", config = get_setup("toggleterm") })
    use({ "phelipetls/jsonpath.nvim" })

    -- Lualine
    use({
        "nvim-lualine/lualine.nvim",
        config = get_setup("lualine"),
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- cmp plugins
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" }, -- Buffer completions
            { "hrsh7th/cmp-path" }, -- Path complei/kkions
            { "hrsh7th/cmp-nvim-lua" },
            { "hrsh7th/cmp-cmdline" }, -- Cmdline completions
            { "saadparwaiz1/cmp_luasnip" }, -- Snippet completions
            { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
        },
        config = get_setup("cmp"),
    }) -- The completion plugin

    use({
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = get_setup("autopairs"),
    })

    -- colorscheme
    use("rmehri01/onenord.nvim")
    use("sam4llis/nvim-tundra")

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- Treesitter
    use("mrjones2014/nvim-ts-rainbow")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = get_setup("treesitter-config"),
    })
    use({ "nvim-treesitter/nvim-treesitter-textobjects" })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "b0o/schemastore.nvim",
            -- "ray-x/lsp_signature.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
        },
        config = get_setup("lspconfig"),
    })
    use({ "jose-elias-alvarez/typescript.nvim" })
    use({ "onsails/lspkind-nvim" }) -- Vscode style pictograms
    use({ "folke/trouble.nvim", config = get_setup("trouble") })
    use("simrat39/inlay-hints.nvim")
    use({
        "nvimdev/lspsaga.nvim",
        opt = true,
        branch = "main",
        event = "LspAttach",
        config = get_setup("lspsaga"),
        requires = {
            { "nvim-tree/nvim-web-devicons" },
            --Please make sure you install markdown and markdown_inline parser
            { "nvim-treesitter/nvim-treesitter" },
        },
    })
    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzy-native.nvim" },
        },
        config = get_setup("telescope"),
    })
    use("nvim-telescope/telescope-file-browser.nvim")
    use("ThePrimeagen/git-worktree.nvim")
    use({ "stevearc/dressing.nvim" })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = get_setup("nvim-surround"),
    })

    -- Git
    use("tpope/vim-fugitive")
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        -- event = "BufReadPre",
        config = get_setup("gitsigns"),
    })

    --Various
    use({
        "phaazon/hop.nvim",
        config = get_setup("hop"),
        -- branch = 'v1', -- optional but strongly recommended
    })
    use({
        "simrat39/symbols-outline.nvim",
        config = get_setup("outline"),
    })
    use("kosayoda/nvim-lightbulb")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)