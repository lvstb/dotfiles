local lualine = require("lualine")
local utils = require("utils")

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,

	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,

	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")

		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

local config = {
	options = {
		disabled_filetypes = { "terminal" },
		globalstatus = true,
		component_separators = "",
		section_separators = "",
		theme = {
			normal = { c = { fg = utils.colors.fg, bg = utils.colors.bg0 } },
			inactive = { c = { fg = utils.colors.fg, bg = utils.colors.bg0 } },
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

local function mode_color()
	local color_table = {
		n = utils.colors.green,
		i = utils.colors.blue,
		v = utils.colors.purple,
		[""] = utils.colors.purple,
		V = utils.colors.purple,
		c = utils.colors.orange,
		no = utils.colors.red,
		s = utils.colors.orange,
		S = utils.colors.orange,
		[""] = utils.colors.orange,
		ic = utils.colors.yellow,
		R = utils.colors.red,
		Rv = utils.colors.red,
		cv = utils.colors.red,
		ce = utils.colors.red,
		r = utils.colors.red,
		rm = utils.colors.red,
		["r?"] = utils.colors.cyan,
		["!"] = utils.colors.red,
		t = utils.colors.yellow,
	}

	return { fg = color_table[vim.fn.mode()] }
end

local function buffer_git_diff()
	local diff = vim.b.gitsigns_status_dict

	if diff then
		return { added = diff.added, modified = diff.changed, removed = diff.removed }
	else
		return {}
	end
end

-- Cool, but kinda dumb too
-- local function visual_progress()
--   local chars = { "▔▔", "🭶🭶", "🭷🭷", "🭸🭸", "🭹🭹", "🭺🭺", "🭻🭻", "▁▁" }
--   local current_line = vim.fn.line(".")
--   local total_lines = vim.fn.line("$")
--   local line_ratio = current_line / total_lines
--   local index = math.ceil(line_ratio * #chars)
--
--   return chars[index]
-- end

ins_left({
	function()
		return "▉"
	end,
	color = mode_color,
	padding = { left = 0, right = 1 },
})

ins_left({
	function()
		return "  "
	end,
	color = mode_color,
	padding = { right = 1 },
})

ins_left({
	"filesize",
	cond = conditions.buffer_not_empty,
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
	path = 1,
	color = { fg = utils.colors.purple },
})

ins_left({ "location" })

ins_left({ "progress", color = { fg = utils.colors.fg } })

-- ins_left { visual_progress, color = { fg = utils.colors.fg } }

ins_left({
	"diagnostics",
	cond = conditions.buffer_not_empty,
	sources = { "nvim_diagnostic" },
	always_visible = true,
	symbols = {
		error = " " .. utils.icons.diagnostics.ERROR,
		warn = " " .. utils.icons.diagnostics.WARNING,
		info = " " .. utils.icons.diagnostics.INFO,
		hint = " " .. utils.icons.diagnostics.HINT,
	},
	padding = { left = 1 },
	diagnostics_color = {
		error = { fg = utils.colors.red },
		warn = { fg = utils.colors.yellow },
		info = { fg = utils.colors.blue },
		hint = { fg = utils.colors.green },
	},
})

-- -- Insert mid section
-- ins_left {
--   function()
--     return '%='
--   end,
-- }
--
-- ins_right({
-- 	require("lazy.status").updates,
-- 	cond = require("lazy.status").has_updates,
-- 	color = { fg = utils.colors.orange },
-- })

ins_right({
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()

		if next(clients) == nil then
			return msg
		end

		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
				return client.name
			end
		end

		return msg
	end,
	icon = " ",
	color = { fg = utils.colors.cyan },
	cond = conditions.buffer_not_empty,
})

ins_right({
	"diff",
	colored = true,
	symbols = {
		added = utils.icons.git.status_added,
		modified = utils.icons.git.status_modified,
		removed = utils.icons.git.status_removed,
	},
	cond = conditions.buffer_not_empty,
	diff_color = {
		added = { fg = utils.colors.green },
		modified = { fg = utils.colors.blue },
		removed = { fg = utils.colors.red },
	},
	source = buffer_git_diff,
})

ins_right({
	"branch",
	icon = " ",
	color = { fg = utils.colors.magenta },
})

ins_right({
	function()
		return "🮋"
	end,
	color = mode_color,
	padding = { left = 1 },
})

lualine.setup(config)
