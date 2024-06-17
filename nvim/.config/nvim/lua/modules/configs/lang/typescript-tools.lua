return function()
	require("typescript-tools").setup({
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end,
		settings = {
			separate_diagnostic_server = false,
			expose_as_code_action = "all",

			-- tsserver_plugins = {},
			tsserver_max_memory = "auto",
			complete_function_calls = true,
			include_completions_with_insert_text = true,
			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
				includeCompletionsForModuleExports = true,
				quotePreference = "auto",
				-- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
			},
		},
	})
end