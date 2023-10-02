return function()
	local rainbow_delimiters = require("rainbow-delimiters")
	require("rainbow-delimiters.setup")({ -- This module contains a number of default definitions
		strategy = {
			[""] = rainbow_delimiters.strategy["global"],
			vim = rainbow_delimiters.strategy["local"],
		},
		query = {
			[""] = "rainbow-delimiters",
			lua = "rainbow-blocks",
		},
		-- highlight = {
		-- 	"RainbowDelimiterRed",
		-- 	"RainbowDelimiterYellow",
		-- 	"RainbowDelimiterBlue",
		-- 	"RainbowDelimiterOrange",
		-- 	"RainbowDelimiterGreen",
		-- 	"RainbowDelimiterViolet",
		-- 	"RainbowDelimiterCyan",
		-- },
	})
end