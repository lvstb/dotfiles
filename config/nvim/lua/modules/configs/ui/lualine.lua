return function()
	local lualine = require("lualine")
	-- local utils = require("utils")

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
			theme = "catppuccin",
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
		extensions = {
			"quickfix",
			"nvim-tree",
			"nvim-dap-ui",
			"toggleterm",
			"fugitive",
			outline,
			diffview,
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
			n = colors.green,
			i = colors.blue,
			v = colors.purple,
			[""] = colors.purple,
			V = colors.purple,
			c = colors.orange,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.red,
			Rv = colors.red,
			cv = colors.red,
			ce = colors.red,
			r = colors.red,
			rm = colors.red,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.yellow,
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
		"branch",
		icon = " ",
		color = { fg = colors.magenta },
	})

	-- ins_left { visual_progress, color = { fg = utils.colors.fg } }

	ins_left({
		"diagnostics",
		cond = conditions.buffer_not_empty,
		sources = { "nvim_diagnostic" },
		always_visible = true,
		padding = { left = 1 },
		diagnostics_color = {
			error = { fg = colors.red },
			warn = { fg = colors.yellow },
			info = { fg = colors.blue },
			hint = { fg = colors.green },
		},
	})

	ins_left({
		function()
			local _cache = { context = "", bufnr = -1 }
			local exclude = {
				["terminal"] = true,
				["toggleterm"] = true,
				["prompt"] = true,
				["NvimTree"] = true,
				["help"] = true,
			}
			if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
				return "" -- Excluded filetypes
			else
				local currbuf = vim.api.nvim_get_current_buf()
				local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
				if ok and lspsaga:get_winbar() ~= nil then
					_cache.context = lspsaga:get_winbar()
					_cache.bufnr = currbuf
				elseif _cache.bufnr ~= currbuf then
					_cache.context = "" -- Reset [invalid] cache (usually from another buffer)
				end

				return _cache.context
			end
		end,
	})

	-- -- Insert mid section
	-- ins_left {
	--   function()
	--     return '%='
	--   end,
	-- }
	--

	ins_right({
		"diff",
		colored = true,
		-- symbols = {
		-- 	added = utils.icons.git.status_added,
		-- 	modified = utils.icons.git.status_modified,
		-- 	removed = utils.icons.git.status_removed,
		-- },
		cond = conditions.buffer_not_empty,
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.blue },
			removed = { fg = colors.red },
		},
		source = buffer_git_diff,
	})
	ins_right({
		"filename",
		cond = conditions.buffer_not_empty,
		path = 1,
		color = { fg = colors.purple },
	})

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
		color = { fg = colors.cyan },
		cond = conditions.buffer_not_empty,
	})

	-- ins_right({
	-- 	"filesize",
	-- 	cond = conditions.buffer_not_empty,
	-- })

	ins_right({ "location" })

	ins_right({ "progress", color = { fg = colors.fg } })
	ins_right({
		function()
			return "🮋"
		end,
		color = mode_color,
		padding = { left = 1 },
	})

	lualine.setup(config)
end
-- return function()
-- 	local colors = require("modules.utils").get_palette()
-- 	local icons = {
-- 		diagnostics = require("modules.utils.icons").get("diagnostics", true),
-- 		misc = require("modules.utils.icons").get("misc", true),
-- 		ui = require("modules.utils.icons").get("ui", true),
-- 	}

-- 	local function escape_status()
-- 		local ok, m = pcall(require, "better_escape")
-- 		return ok and m.waiting and icons.misc.EscapeST or ""
-- 	end

-- 	local _cache = { context = "", bufnr = -1 }
-- 	local function lspsaga_symbols()
-- 		local exclude = {
-- 			["terminal"] = true,
-- 			["toggleterm"] = true,
-- 			["prompt"] = true,
-- 			["NvimTree"] = true,
-- 			["help"] = true,
-- 		}
-- 		if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
-- 			return "" -- Excluded filetypes
-- 		else
-- 			local currbuf = vim.api.nvim_get_current_buf()
-- 			local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
-- 			if ok and lspsaga:get_winbar() ~= nil then
-- 				_cache.context = lspsaga:get_winbar()
-- 				_cache.bufnr = currbuf
-- 			elseif _cache.bufnr ~= currbuf then
-- 				_cache.context = "" -- Reset [invalid] cache (usually from another buffer)
-- 			end

-- 			return _cache.context
-- 		end
-- 	end

-- 	local function diff_source()
-- 		local gitsigns = vim.b.gitsigns_status_dict
-- 		if gitsigns then
-- 			return {
-- 				added = gitsigns.added,
-- 				modified = gitsigns.changed,
-- 				removed = gitsigns.removed,
-- 			}
-- 		end
-- 	end

-- 	local function get_cwd()
-- 		local cwd = vim.fn.getcwd()
-- 		local is_windows = require("core.global").is_windows
-- 		if not is_windows then
-- 			local home = require("core.global").home
-- 			if cwd:find(home, 1, true) == 1 then
-- 				cwd = "~" .. cwd:sub(#home + 1)
-- 			end
-- 		end
-- 		return icons.ui.RootFolderOpened .. cwd
-- 	end

-- 	local mini_sections = {
-- 		lualine_a = { "filetype" },
-- 		lualine_b = {},
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {},
-- 		lualine_z = {},
-- 	}
-- 	local outline = {
-- 		sections = mini_sections,
-- 		filetypes = { "lspsagaoutline" },
-- 	}
-- 	local diffview = {
-- 		sections = mini_sections,
-- 		filetypes = { "DiffviewFiles" },
-- 	}

-- 	local function python_venv()
-- 		local function env_cleanup(venv)
-- 			if string.find(venv, "/") then
-- 				local final_venv = venv
-- 				for w in venv:gmatch("([^/]+)") do
-- 					final_venv = w
-- 				end
-- 				venv = final_venv
-- 			end
-- 			return venv
-- 		end

-- 		if vim.bo.filetype == "python" then
-- 			local venv = os.getenv("CONDA_DEFAULT_ENV")
-- 			if venv then
-- 				return string.format("%s", env_cleanup(venv))
-- 			end
-- 			venv = os.getenv("VIRTUAL_ENV")
-- 			if venv then
-- 				return string.format("%s", env_cleanup(venv))
-- 			end
-- 		end
-- 		return ""
-- 	end

-- 	require("lualine").setup({
-- 		options = {
-- 			icons_enabled = true,
-- 			theme = "onenord",
-- 			-- theme = {
-- 			-- 	normal = { c = { fg = colors.fg, bg = colors.bg } },
-- 			-- 	inactive = { c = { fg = colors.fg, bg = colors.bg } },
-- 			-- },
-- 			disabled_filetypes = {},
-- 			component_separators = "|",
-- 			section_separators = { left = "", right = "" },
-- 		},
-- 		sections = {
-- 			lualine_a = { { "mode" } },
-- 			lualine_b = { { "branch" }, { "diff", source = diff_source } },
-- 			lualine_c = { lspsaga_symbols },
-- 			lualine_x = {
-- 				{ escape_status },
-- 				{
-- 					"diagnostics",
-- 					sources = { "nvim_diagnostic" },
-- 					symbols = {
-- 						error = icons.diagnostics.Error,
-- 						warn = icons.diagnostics.Warning,
-- 						info = icons.diagnostics.Information,
-- 						hint = icons.diagnostics.Hint_alt,
-- 					},
-- 				},
-- 				{ get_cwd },
-- 			},
-- 			lualine_y = {
-- 				{ "filetype", colored = true, icon_only = true },
-- 				{ python_venv },
-- 				{ "encoding" },
-- 				{
-- 					"fileformat",
-- 					icons_enabled = true,
-- 					symbols = {
-- 						unix = "LF",
-- 						dos = "CRLF",
-- 						mac = "CR",
-- 					},
-- 				},
-- 			},
-- 			lualine_z = { "progress", "location" },
-- 		},
-- 		inactive_sections = {
-- 			lualine_a = {},
-- 			lualine_b = {},
-- 			lualine_c = { "filename" },
-- 			lualine_x = { "location" },
-- 			lualine_y = {},
-- 			lualine_z = {},
-- 		},
-- 		tabline = {},
-- 		extensions = {
-- 			"quickfix",
-- 			"nvim-tree",
-- 			"nvim-dap-ui",
-- 			"toggleterm",
-- 			"fugitive",
-- 			outline,
-- 			diffview,
-- 		},
-- 	})

-- 	-- Properly set background color for lspsaga
-- 	local winbar_bg = require("modules.utils").hl_to_rgb("StatusLine", true, colors.mantle)
-- 	for _, hlGroup in pairs(require("lspsaga.lspkind").get_kind_group()) do
-- 		require("modules.utils").extend_hl(hlGroup, { bg = winbar_bg })
-- 	end
-- end
