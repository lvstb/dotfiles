local colors = require("utils").colors

vim.opt.background = "dark"
local isExistNord, onenord = pcall(require, "onenord")

if isExistNord then
	onenord.setup({
		borders = true,
		fade_nc = false,
		styles = {
			comments = "italic",
			strings = "NONE",
			keywords = "NONE",
			functions = "italic",
			variables = "bold",
			diagnostics = "underline",
		},
		disable = {
			background = false,
			cursorline = false,
			eob_lines = true,
		},
		custom_highlights = {
			VertSplit = { fg = colors.grey14 },
			BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
			BufferLineFill = { fg = colors.fg, bg = colors.grey14 },
			NvimTreeNormal = { fg = colors.grey5, bg = colors.grey14 },
			WhichKeyFloat = { bg = colors.grey14 },
			GitSignsAdd = { fg = colors.green },
			GitSignsChange = { fg = colors.orange },
			GitSignsDelete = { fg = colors.red },
			NvimTreeFolderIcon = { fg = colors.grey9 },
			NvimTreeIndentMarker = { fg = colors.grey12 },

			NormalFloat = { bg = colors.grey14 },

			TelescopePromptPrefix = { bg = colors.grey14 },
			TelescopePromptNormal = { bg = colors.grey14 },
			TelescopeResultsNormal = { bg = colors.grey15 },
			TelescopePreviewNormal = { bg = colors.grey16 },

			TelescopePromptBorder = { bg = colors.grey14, fg = colors.grey14 },
			TelescopeResultsBorder = { bg = colors.grey15, fg = colors.grey15 },
			TelescopePreviewBorder = { bg = colors.grey16, fg = colors.grey16 },

			TelescopePromptTitle = { fg = colors.grey14 },
			TelescopeResultsTitle = { fg = colors.grey15 },
			TelescopePreviewTitle = { fg = colors.grey16 },

			PmenuSel = { bg = colors.grey13 },
			Pmenu = { bg = colors.grey14 },

			LspFloatWinNormal = { fg = colors.fg, bg = colors.grey14 },
			LspFloatWinBorder = { fg = colors.grey14 },
			-- LspSagaRenameBorder = { bg = colors.grey14, fg = colors.grey14 },
			-- LspSagaDiagnosticBorder = { bg = colors.grey14, fg = colors.grey14 },
			-- LspSagaHoverBorder = { bg = colors.grey14, fg = colors.grey14 },
			-- LspSagaDefPreviewBorder = { bg = colors.grey14, fg = colors.grey14 },
			-- LspSagaCodeActionBorder = { bg = colors.grey14, fg = colors.grey14 },
			-- LspSagaSignatureHelpBorder = { bg = colors.grey14, fg = colors.grey14 },
			-- LspLinesDiagBorder = { bg = colors.grey14, fg = colors.grey14 },
			--
			-- LspSagaSignatureHelpBorder = { bg = colors.grey14, fg = colors.grey14 },
			-- LspSagaLspFinderBorder = { bg = colors.grey14, fg = colors.grey14 },
		},
	})
end

return _M
