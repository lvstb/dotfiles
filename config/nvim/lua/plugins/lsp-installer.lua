local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugins.lsp.handlers").on_attach,
		capabilities = require("plugins.lsp.handlers").capabilities,
	}

	if server.name == "yamlls" then
	    local yamlls_opts = require("plugins.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

	if server.name == "jsonls" then
	    local jsonls_opts = require("plugins.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko" then
		local sumneko_opts = require("plugins.lsp.settings.sumneko")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	-- if server.name == "pyright" then
	-- 	local pyright_opts = require("config.lsp.settings.pyright")
	-- 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	-- end

	-- if server.name == "gopls" then
	-- 	local gopls_opts = require("config.lsp.settings.gopls")
	-- 	opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	-- end

	-- if server.name == "dockerls" then
	-- 	local dockerls_opts = require("config.lsp.settings.dockerls")
	-- 	opts = vim.tbl_deep_extend("force", dockerls_opts, opts)
	-- end

	-- if server.name == "cssls" then
	-- 	local cssls_opts = require("config.lsp.settings.cssls")
	-- 	opts = vim.tbl_deep_extend("force", cssls_opts, opts)
	-- end

	-- if server.name == "html" then
	-- 	local html_opts = require("config.lsp.settings.html")
	-- 	opts = vim.tbl_deep_extend("force", html_opts, opts)
	-- end

	if server.name == "tsserver" then
		local tsserver_opts = require("plugins.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	-- if server.name == "zk" then
	-- 	local zk_opts = require("config.lsp.settings.zk")
	-- 	opts = vim.tbl_deep_extend("force", zk_opts, opts)
	-- end

	-- if server.name == "rust_analyzer" then
	-- 	local rust_analyzer_opts = require("config.lsp.settings.rust_analyzer")
	-- 	opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
	-- end
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
