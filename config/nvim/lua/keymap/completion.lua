local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback

local plug_map = {
	-- LSP-related keymaps, work only when event = { "InsertEnter", "LspStart" }
	["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait():with_desc("lsp: Info"),
	["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait():with_desc("lsp: Restart"),
	-- ["n|go"] = map_cr("Lspsaga outline"):with_noremap():with_silent():with_desc("lsp: Toggle outline"),
	-- ["n|g["] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent():with_desc("lsp: Prev diagnostic"),
	-- ["n|g]"] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent():with_desc("lsp: Next diagnostic"),
	-- ["n|leader>ld"] = map_cr("Lspsaga show_line_diagnostics")
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("lsp: Line diagnostic"),
	["n|g["] = map_callback(function()
			require("trouble").previous({ skip_groups = true, jump = true })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: previous diagnostic"),

	["n|g]"] = map_callback(function()
			require("trouble").next({ skip_groups = true, jump = true })
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: next diagnostic"),

	["n|<leader>v"] = map_cmd("<cmd>vsplit | lua vim.lsp.buf.definition()<cr>")
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Open definition in v split"),
	["n|K"] = map_callback(function()
			vim.lsp.buf.hover()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Hover Documentation"),
	["n|gl"] = map_callback(function()
			vim.diagnostic.open_float()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Open diagnostic float"),
	["n|<leader>ws"] = map_callback(function()
			require("telescope.builtin").lsp_dynamic_workspace_symbols()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: [W]orkspace, [S]ymbols"),
	["n|gy"] = map_callback(function()
			require("telescope.builtin").lsp_type_definitions()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Goto type definition"),
	["n|gs"] = map_callback(function()
			vim.lsp.buf.signature_help()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Signature help"),
	["n|gA"] = map_callback(function()
			vim.lsp.buf.range_code_action()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Range code action"),
	["n|ga"] = map_callback(function()
			vim.lsp.buf.code_action()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Code action"),
	["n|gr"] = map_callback(function()
			vim.lsp.buf.rename()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Rename all references"),
	-- ["n|gh"] = map_callback(function()
	-- 		vim.lsp.buf.references()
	-- 	end)
	-- 	:with_noremap()
	-- 	:with_silent()
	-- 	:with_desc("lsp: Show references"),
	["n|<leader>ci"] = map_callback(function()
			vim.lsp.buf.incoming_calls()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show incoming_calls"),
	["n|<leader>co"] = map_callback(function()
			vim.lsp.buf.outgoing_calls()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Show outgoing_calls"),
	["n|<leader>hi"] = map_callback(function()
			_toggle_inlay_hints()
		end)
		:with_noremap()
		:with_silent()
		:with_desc("lsp: Toggle inlay hints"),
	["n|gd"] = map_cr("Glance definitions"):with_silent():with_buffer(buf):with_desc("lsp: Preview definition"),
	-- ["n|gD"] = map_cr("Lspsaga goto_definition"):with_silent():with_buffer(buf):with_desc("lsp: Goto definition"),
	["n|gh"] = map_cr("Glance references"):with_silent():with_buffer(buf):with_desc("lsp: Show reference"),
	["n|gi"] = map_cr("Glance implementations"):with_silent():with_buffer(buf):with_desc("lsp: Show implementation"),
	-- ["n|gR"] = map_cr("Lspsaga rename ++project")
	-- 	:with_noremap()wj
	-- 	:with_silent()
	-- 	:with_desc("lsp: Rename in project range"),
	-- ["n|gd"] = map_cr("Lspsaga peek_definition"):with_noremap():with_silent():with_desc("lsp: Preview definition"),
}

bind.nvim_load_mapping(plug_map)
