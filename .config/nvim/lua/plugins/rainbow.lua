return {
	"HiPhish/rainbow-delimiters.nvim",
	url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	config = function()
		-- This module contains a number of default definitions
		--local rainbow_delimiters = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			-- strategy = {
			-- 	[""] = rainbow_delimiters.strategy["global"],
			-- 	vim = rainbow_delimiters.strategy["local"],
			-- },
			-- query = {
			-- 	[""] = "rainbow-delimiters",
			-- 	lua = "rainbow-blocks",
			-- },
			-- priority = {
			-- 	[""] = 110,
			-- 	lua = 210,
			-- },
			-- highlight = {
			-- 	"RainbowDelimiterBlue",
			-- 	"RainbowDelimiterRed",
			-- 	"RainbowDelimiterYellow",
			-- 	"RainbowDelimiterViolet",
			-- 	"RainbowDelimiterGreen",
			-- 	"RainbowDelimiterCyan",
			-- 	"RainbowDelimiterOrange",
			-- },
		}
	end,
}
