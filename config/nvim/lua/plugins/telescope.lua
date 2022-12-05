local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		file_browser = {
			-- disables netrw and use telescope-file-browser in its place
			hijack_netwrw = true,
			hidden = true,
			mappings = {
				i = {
					["<c-n>"] = fb_actions.create,
					["<c-r>"] = fb_actions.rename,
					["<c-h>"] = fb_actions.toggle_hidden,
					["<c-x>"] = fb_actions.remove,
					["<c-p>"] = fb_actions.move,
					["<c-y>"] = fb_actions.copy,
					["<c-a>"] = fb_actions.select_all,
				},
				n = {},
			},
		},
	},
})
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("file_browser")

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end

require("telescope.builtin").lsp_definitions({ jump_type = "vsplit" })
require("telescope.builtin").lsp_type_definitions({ jump_type = "vpslit" })

M.git_branches = function()
	require("telescope.builtin").git_branches({
		attach_mappings = function(_, map)
			map("i", "<c-d>", actions.git_delete_branch)
			map("n", "<c-d>", actions.git_delete_branch)
			return true
		end,
	})
end

return M
