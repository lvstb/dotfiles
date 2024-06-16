return function()
	require("mason").setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = require("core.settings").lsp_deps,
	})

	require("lspconfig.ui.windows").default_options.border = "single"

	require("neodev").setup()

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	require("modules.configs.completion.mason-lspconfig").setup()

	vim.diagnostic.config({
		title = false,
		underline = true,
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			source = "always",
			style = "minimal",
			border = "rounded",
			header = "",
			prefix = "",
		},
	})

	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end
