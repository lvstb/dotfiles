return {
	settings = {
		cmd = { "/usr/local/bin/snyk-ls", "-f", "/var/log/snyk-ls-vim.log" },
		root_dir = function(name)
			return require("lspconfig").util.find_git_ancester(name) or vim.loop.os_homedir()
		end,
		init_options = { activateSnykCode = true },
	},
}
