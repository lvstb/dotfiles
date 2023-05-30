local completion = {}

completion["neovim/nvim-lspconfig"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("completion.lsp"),
	dependencies = {
		{ "ray-x/lsp_signature.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"nvimdev/lspsaga.nvim",
			config = require("completion.lspsaga"),
		},
		{
			"lvimuser/lsp-inlayhints.nvim",
			config = require("completion.inlay-hints"),
			branch = "anticonceal",
			event = { "LspAttach" },
		},
	},
}
completion["jose-elias-alvarez/null-ls.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("completion.null-ls"),
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
}
completion["hrsh7th/nvim-cmp"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("completion.cmp"),
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			config = require("completion.luasnip"),
		},
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "ray-x/cmp-treesitter" },
		-- { "tzachar/cmp-tabnine", build = "./install.sh", config = require("completion.tabnine") },
		-- {
		-- 	"jcdickinson/codeium.nvim",
		-- 	dependencies = {
		-- 		"nvim-lua/plenary.nvim",
		-- 		"MunifTanjim/nui.nvim",
		-- 	},
		-- 	config = require("completion.codeium"),
		-- },
	},
}
completion["zbirenbaum/copilot.lua"] = {
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	config = require("completion.copilot"),
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = require("completion.copilot-cmp"),
		},
	},
}
-- completion["lvimuser/lsp-inlayhints.nvim"] = {
-- 	lazy = true,
-- 	event = "LspAttach",
-- 	opts = {},
-- 	config = function(_, opts)
-- 		require("lsp-inlayhints").setup(opts)
-- 		vim.api.nvim_create_autocmd("LspAttach", {
-- 			group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
-- 			callback = function(args)
-- 				if not (args.data and args.data.client_id) then
-- 					return
-- 				end
-- 				local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 				require("lsp-inlayhints").on_attach(client, args.buf)
-- 			end,
-- 		})
-- 	end,
-- }

return completion