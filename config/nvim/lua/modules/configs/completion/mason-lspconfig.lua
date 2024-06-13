-- ~/.config/nvim/lua/modules/configs/completion/lsp/mason-lspconfig.lua

local M = {}

local severity_map = {
	["Error"] = vim.diagnostic.severity.ERROR,
	["Warning"] = vim.diagnostic.severity.WARN,
	["Information"] = vim.diagnostic.severity.INFO,
	["Hint"] = vim.diagnostic.severity.HINT,
}

M.setup = function()
	local diagnostics_virtual_text = require("core.settings").diagnostics_virtual_text
	local diagnostics_level = require("core.settings").diagnostics_level

	local nvim_lsp = require("lspconfig")
	local mason_lspconfig = require("mason-lspconfig")
	local mason_tool_installer = require("mason-tool-installer")

	require("lspconfig.ui.windows").default_options.border = "rounded"

	mason_lspconfig.setup({
		ensure_installed = require("core.settings").lsp_deps,
	})

	mason_tool_installer.setup({
		ensure_installed = require("core.settings").linter_deps,
	})
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		signs = true,
		underline = true,
		virtual_text = diagnostics_virtual_text and {
			severity = {
				min = severity_map[diagnostics_level],
			},
		} or false,
		update_in_insert = false,
	})

	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	capabilities.textDocument.inlayHint = {
		-- dynamicRegistration = false,
		resolveSupport = {
			properties = {
				"textDocument/inlayHint",
			},
		},
	}

	local opts = {
		capabilities = capabilities,
		on_attach = require("modules.configs.completion.lsp.on_attach").on_attach,
	}

	--- A handler to setup all servers defined in the `servers` directory
	--- @param server_name string
	local function mason_lsp_handler(server_name)
		local ok, server_config = pcall(require, "modules.configs.completion.servers." .. server_name)

		if ok then
			nvim_lsp[server_name].setup(vim.tbl_deep_extend("force", opts, server_config))
		else
			nvim_lsp[server_name].setup(opts)
		end
	end

	mason_lspconfig.setup_handlers({ mason_lsp_handler })
end

return M
