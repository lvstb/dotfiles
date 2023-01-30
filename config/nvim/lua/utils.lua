local M = {}

function M.is_buffer_empty()
	-- Check whether the current buffer is empty
	return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
	-- Check if the windows width is greater than a given number of columns
	return vim.fn.winwidth(0) / 2 > cols
end

M.colors = {
	bg = "#2e3440",
	fg = "#ECEFF4",
	red = "#bf616a",
	orange = "#d08770",
	yellow = "#ebcb8b",
	blue = "#5e81ac",
	green = "#a3be8c",
	cyan = "#88c0d0",
	magenta = "#b48ead",
	pink = "#FFA19F",
	grey1 = "#f8fafc",
	grey2 = "#f0f1f4",
	grey3 = "#eaecf0",
	grey4 = "#d9dce3",
	grey5 = "#c4c9d4",
	grey6 = "#b5bcc9",
	grey7 = "#929cb0",
	grey8 = "#8e99ae",
	grey9 = "#74819a",
	grey10 = "#616d85",
	grey11 = "#464f62",
	grey12 = "#3a4150",
	grey13 = "#333a47",
	grey14 = "#242932",
	grey15 = "#1e222a",
	grey16 = "#1c1f26",
	grey17 = "#0f1115",
	grey18 = "#0d0e11",
	grey19 = "#020203",
}

M.icons = {
	fillchars = {
		foldopen = "",
		foldclose = "",
		fold = " ",
		foldsep = " ",
		diff = "╱",
		eob = " ",
	},
	listchars = {
		space = " ",
		tab = " ",
		trail = "•",
		extends = "❯",
		precedes = "❮",
		nbsp = "␣",
	},
	diagnostics = {
		ERROR = " ",
		WARNING = " ",
		INFO = " ",
		HINT = " ",
		DEBUG = " ",
		TRACE = " ",
	},
	dap = {
		breakpoint = " ",
		breakpoint_condition = " ",
		log_point = " ",
		stopped = " ",
		breakpoint_rejected = " ",
		pause = " ",
		play = " ",
		step_into = " ",
		step_over = " ",
		step_out = " ",
		step_back = " ",
		run_last = " ",
		terminate = " ",
	},
	git = {
		status_added = " ",
		status_removed = " ",
		status_modified = " ",
		added = " ",
		deleted = " ",
		modified = " ",
		renamed = " ",
		untracked = " ",
		ignored = " ",
		unstaged = " ",
		staged = " ",
		conflict = " ",
	},
	misc = {
		collapsed = " ",
		expanded = " ",
		current = " ",
		folder_empty = "",
		folder_closed = "",
		folder_open = "",
		file = "",
	},
}

return M
