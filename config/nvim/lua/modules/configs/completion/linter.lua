return function()
	local lint = require("lint")
	local linters = require("lint").linters

	lint.linters_by_ft = {
		lua = { "selene" },
		css = { "stylelint" },
		sh = { "shellcheck" },
		markdown = { "markdownlint" },
		yaml = { "yamllint" },
		python = { "pylint" },
		golang = { "golangcilint" },
		dockerfile = { "hadolint" },
		html = { "prettier" },
		gitcommit = {},
		json = {},
		javascript = {},
		typescript = {},
		toml = {},
		text = {},
	}

	-- use for codespell for all except bib and css
	-- for ft, _ in pairs(lint.linters_by_ft) do
	-- 	if ft ~= "bib" and ft ~= "css" then
	-- 		table.insert(lint.linters_by_ft[ft], "codespell")
	-- 	end
	-- end
	--
	-- linters.codespell.args = {
	-- 	"--ignore-words",
	-- 	linterConfig .. "/codespell-ignore.txt",
	-- 	"--builtin=rare,clear,informal,code,names,en-GB_to_en-US",
	-- }local luacheck = lint.linters.luacheck
	linters.selene.args = {
		"--formatter",
		"plain",
		"--globals",
		"vim",
		"--codes",
		"--ranges",
		"-",
	}

	linters.shellcheck.args = {
		"--shell=bash", -- force to work with zsh
		"--format=json",
		"-",
	}

	linters.yamllint.args = {
		"-",
		"--config-data",
		"{extends: default, rules: {line-length: disable, braces: {max-spaces-inside: 0, level: warning}, document-start: {present: false}}}",
	}

	-- linters.markdownlint.args = {
	-- 	"--disable=no-trailing-spaces", -- not disabled in config, so it's enabled for formatting
	-- 	"--disable=no-multiple-blanks",
	-- 	"--config=" .. linterConfig .. "/markdownlint.yaml",
	-- }

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})
	vim.keymap.set("n", "<leader>ll", function()
		lint.try_lint()
	end, { desc = "Trigger linting for current file" })
	-- run once on start
	require("lint").try_lint()
end
