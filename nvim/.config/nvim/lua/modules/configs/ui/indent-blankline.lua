return function()
	local char = { "│", "┃" }

	local hooks = require("ibl.hooks")
	hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
	hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

	require("ibl").setup({
		indent = {
			highlight = { "IblIndent" },
			char = char[1],
			tab_char = char[1],
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
		scope = {
			char = char[2],
			-- enabled = true,
			highlight = { "IblScope" },
		},
	})
end
