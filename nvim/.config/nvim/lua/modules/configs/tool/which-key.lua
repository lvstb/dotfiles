return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
		misc = require("modules.utils.icons").get("misc"),
	}

	require("which-key").setup({
		plugins = {
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				nav = false,
				z = true,
				g = true,
			},
		},

		icons = {
			breadcrumb = icons.ui.Separator,
			separator = icons.misc.Vbar,
			group = icons.misc.Add,
		},

		win = {
			no_overlap = true,
			border = "none",
			-- position = "bottom",
			-- margin = { 1, 0, 1, 0 },
			padding = { 1, 1, 1, 1 },
			wo = {
				winblend = 0,
			},
		},
	})
end