local M = {}

function M.setup()
	local utils = require("../../utils")
	local signs = {
		Error = utils.icons.diagnostics.ERROR,
		Warn = utils.icons.diagnostics.WARNING,
		Hint = utils.icons.diagnostics.HINT,
		Info = utils.icons.diagnostics.INFO,
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = nil })
	end

	vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float()]])

	-- Prettier inline diagnostics messages
	local function format_diagnostic(diagnostic)
		local icon = utils.icons.diagnostics.ERROR
		if diagnostic.severity == vim.diagnostic.severity.WARN then
			icon = utils.icons.diagnostics.WARNING
		elseif diagnostic.severity == vim.diagnostic.severity.INFO then
			icon = utils.icons.diagnostics.INFO
		elseif diagnostic.severity == vim.diagnostic.severity.HINT then
			icon = utils.icons.diagnostics.HINT
		end

		local message = string.format("%s %s", icon, diagnostic.message)
		if diagnostic.code and diagnostic.source then
			message = string.format("%s [%s][%s] %s", icon, diagnostic.source, diagnostic.code, diagnostic.message)
		elseif diagnostic.code or diagnostic.source then
			message = string.format("%s [%s] %s", icon, diagnostic.code or diagnostic.source, diagnostic.message)
		end

		return message .. " "
	end

	local config = {
		virtual_text = {
			prefix = "",
			spacing = 2,
			source = false,
			severity = {
				min = vim.diagnostic.severity.HINT,
			},
			format = format_diagnostic,
		},
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			-- border = user_config.border,
			focusable = false,
			header = { utils.icons.diagnostics.DEBUG .. " Diagnostics:", "DiagnosticInfo" },
			scope = "line",
			suffix = "",
			source = false,
			format = format_diagnostic,
		},
	}

	vim.diagnostic.config(config)
end

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {})
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {})
return M
