return function()
	require("ibl").setup({
		indent = {
			tab_char = "▎",
		},
		scope = {
			enabled = true,
		},
		exclude = {
			filetypes = {
				"NvimTree",
				"TelescopePrompt",
				"dashboard",
				"dotooagenda",
				"flutterToolsOutline",
				"fugitive",
				"git",
				"gitcommit",
				"help",
				"json",
				"log",
				"markdown",
				"peekaboo",
				"startify",
				"todoist",
				"txt",
				"vimwiki",
				"vista",
			},
			buftypes = {
				"terminal",
				"nofile",
			},
		},
	})
end