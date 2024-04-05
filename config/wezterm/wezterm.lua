-- Pull in the wezterm API
local wezterm = require("wezterm")
local larsppuccin = require("colorscheme")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.bold_brightens_ansi_colors = true
-- font
config.font = wezterm.font("Fira Code", { weight = "Regular", stretch = "Expanded", style = "Normal" })
config.font_size = 15.0
config.cell_width = 1.1
config.line_height = 1.1
-- config.font_rules = {
-- 	{
-- 		italic = true,
-- 		font = wezterm.font("Fira Code", { weight = "Medium", stretch = "Normal", style = "Italic" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		font = wezterm.font("Fira Code ", { weight = "Bold", stretch = "Normal", style = "Normal" }),
-- 	},
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font("Fira Code", { weight = "Bold", stretch = "Normal", style = "Italic" }),
-- 	},
-- }
-- This is where you actually apply your config choices
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- changing the color scheme:
-- config.color_scheme = "catppuccin"
config.colors = larsppuccin.colors
config.max_fps = 120
config.scrollback_lines = 5000
config.enable_scroll_bar = false
config.check_for_updates = false
config.window_padding = {
	left = 15,
	right = 15,
	top = 10,
	bottom = 0,
}
-- config.scrollback_lines =5000,
-- config.enable_scroll_bar = false,
-- config.check_for_updates = false,
-- and finally, return the configuration to wezterm
return config
