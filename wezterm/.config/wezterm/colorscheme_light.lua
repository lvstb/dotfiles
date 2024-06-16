local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Latte for WezTerm",
	colors = {
		foreground = "#654735",
		background = "#f9f5d7",
		cursor_bg = "#654735",
		cursor_border = "#654735",
		cursor_fg = "#f9f5d7",
		selection_bg = "#d1c7a3",
		selection_fg = "#654735",

		ansi = { "#e3dec3", "#c14a4a", "#6c782e", "#b47109", "#45707a", "#945e80", "#4c7a5d", "#7c6f64" },
		brights = { "#bfb695", "#c14a4a", "#6c782e", "#b47109", "#45707a", "#945e80", "#4c7a5d", "#654735" },

		tab_bar = {
			background = "#f9f5d7",
			active_tab = {
				bg_color = "#d1c7a3",
				fg_color = "#654735",
			},
			inactive_tab = {
				bg_color = "#f9f5d7",
				fg_color = "#805942",
			},
			inactive_tab_hover = {
				bg_color = "#d1c7a3",
				fg_color = "#805942",
			},
			new_tab = {
				bg_color = "#f9f5d7",
				fg_color = "#805942",
			},
			new_tab_hover = {
				bg_color = "#d1c7a3",
				fg_color = "#805942",
			},
		},
	},
}
