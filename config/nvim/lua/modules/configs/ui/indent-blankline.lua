return function()
	require("ibl").setup({
		indent = {
			char = { "│" },
		},
		scope = {
			enabled = true,
		},
		context_patterns = {
			"^if",
			"^table",
			"block",
			"class",
			"for",
			"function",
			"if_statement",
			"import",
			"list_literal",
			"method",
			"selector",
			"type",
			"var",
			"while",
		},
		show_trailing_blankline_indent = false,
		space_char_blankline = " ",
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