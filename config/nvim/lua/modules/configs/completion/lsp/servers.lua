return {
	jsonls = {
		settings = {
			json = {
				schema = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	},
	terraformls = {
		cmd = { "terraform-ls" },
		arg = { "server" },
		filetypes = { "terraform", "tf", "terraform-vars" },
	},
	lua_ls = {
		Lua = {
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
	bashls = {
		filetypes = { "sh", "zsh" },
	},
	vimls = {
		filetypes = { "vim" },
	},
	tsserver = {},
	gopls = {
		semanticTokens = true,
		analyses = {
			unusedparams = true,
		},
		staticcheck = true,
		hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
		},
	},
	solidity_ls_nomicfoundation = {},
	yamlls = {
		cmd = { "yaml-language-server", "--stdio" },
		filetypes = { "yaml" },
	},
}
