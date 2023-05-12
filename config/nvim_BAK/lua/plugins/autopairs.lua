require("nvim-autopairs").setup({})
-- -- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
local handlers = require("nvim-autopairs.completion.handlers")
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done({
		filetypes = {
			-- "*" is an alias to all filetypes
			["*"] = {
				["("] = {
					kind = {
						cmp.lsp.CompletionItemKind.Function,
						cmp.lsp.CompletionItemKind.Method,
					},
					handler = handlers["*"],
				},
			},
			-- Disable for tex
			tex = false,
		},
	})
)

local function count(base, pattern)
	return select(2, string.gsub(base, "%" .. pattern, ""))
end

local function check_line_balance(opts)
	local closes = count(opts.line, opts.rule.end_pair)
	local opens = count(opts.line, opts.char)

	if closes == 0 then
		return true
	end

	return opens == closes
end

local auto_pairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local ts_conds = require("nvim-autopairs.ts-conds")

auto_pairs.setup({
	map_bs = true,
	map_cr = true,
	check_ts = true,
	fast_wrap = {},
})

-- auto_pairs.remove_rule('(')
-- auto_pairs.remove_rule('{')
-- auto_pairs.remove_rule('[')

auto_pairs.add_rules({
	-- rule("(", ")"):with_pair(check_line_balance),
	-- rule("[", "]"):with_pair(check_line_balance),
	-- rule("{", "}"):with_pair(check_line_balance),

	-- Adding space inside brackets
	rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ "()", "[]", "{}" }, pair)
	end),

	rule("( ", " )")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%)") ~= nil
		end)
		:use_key(")"),

	rule("{ ", " }")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%}") ~= nil
		end)
		:use_key("}"),

	rule("[ ", " ]")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%]") ~= nil
		end)
		:use_key("]"),

	-- 'move through' commas
	rule("", ",")
		:with_move(function(opts)
			return opts.char == ","
		end)
		:with_pair(function()
			return false
		end)
		:with_del(function()
			return false
		end)
		:with_cr(function()
			return false
		end)
		:use_key(","),
})
