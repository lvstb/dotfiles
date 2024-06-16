local wezterm = require("wezterm")

return {
	color_scheme = "larsppuccin",
	colors = {
		foreground = "#ebdbb2",
		background = "#1d2021",
		cursor_bg = "#ebdbb2",
		cursor_border = "#ebdbb2",
		cursor_fg = "#1d2021",
		selection_bg = "#3e4451",
		selection_fg = "#ebdbb2",

		ansi = { "#292929", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		brights = { "#4d4d4d", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#ebdbb2" },

		tab_bar = {
			background = "#1d2021",
			active_tab = {
				bg_color = "#3e4451",
				fg_color = "#ebdbb2",
			},
			inactive_tab = {
				bg_color = "#1d2021",
				fg_color = "#7c6f64",
			},
			inactive_tab_hover = {
				bg_color = "#3e4451",
				fg_color = "#7c6f64",
			},
			new_tab = {
				bg_color = "#1d2021",
				fg_color = "#7c6f64",
			},
			new_tab_hover = {
				bg_color = "#3e4451",
				fg_color = "#7c6f64",
			},
		},
	},
}
