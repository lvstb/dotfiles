local ui = {}

ui["goolord/alpha-nvim"] = {
	lazy = true,
	event = "BufWinEnter",
	config = require("ui.alpha"),
}
ui["folke/noice.nvim"] = {
	event = "VeryLazy",
	enabled = true,
	config = require("ui.noice"),
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		-- "rcarriga/nvim-notify",
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
	},
}
ui["akinsho/bufferline.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.bufferline"),
}
ui["catppuccin/nvim"] = {
	lazy = false,
	name = "catppuccin",
	config = require("ui.catppuccin"),
}
ui["rmehri01/onenord.nvim"] = {
	lazy = false,
	name = "onenord",
	config = require("ui.onenord"),
}
ui["lewis6991/gitsigns.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.gitsigns"),
}
ui["lukas-reineke/indent-blankline.nvim"] = {
	lazy = true,
	main = "ibl",
	event = "BufReadPost",
	config = require("ui.indent-blankline"),
}
ui["nvim-lualine/lualine.nvim"] = {
	lazy = true,
	event = { "BufReadPost", "BufAdd", "BufNewFile" },
	config = require("ui.lualine"),
}
-- needs neovim 0.10
-- ui["zbirenbaum/neodim"] = {
-- 	lazy = true,
-- 	event = "LspAttach",
-- 	config = require("ui.neodim"),
-- }
-- ui["rcarriga/nvim-notify"] = {
-- 	lazy = true,
-- 	event = "VeryLazy",
-- 	config = require("ui.notify"),
-- }
ui["folke/paint.nvim"] = {
	lazy = true,
	event = { "CursorHold", "CursorHoldI" },
	config = require("ui.paint"),
}
ui["dstein64/nvim-scrollview"] = {
	lazy = true,
	event = "BufReadPost",
	config = require("ui.scrollview"),
}
ui["machakann/vim-sandwich"] = {
	lazy = true,
	event = "BufReadPost",
}
ui["edluffy/specs.nvim"] = {
	lazy = true,
	event = "CursorMoved",
	config = require("ui.specs"),
}
ui["stevearc/dressing.nvim"] = {
	opts = {},
}

return ui
