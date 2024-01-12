return {
	{
		"CodeGradox/onehalf-lush",
		lazy = false,
		priority = 1000,
		config = function()
			vim.api.nvim_set_option("background", "dark")
			vim.cmd("colorscheme onehalf-lush-dark") -- zephyr, zephyrium, nightfox, earlysummer, darker, ferrum, system76, enfocado, aurora
		end,
	},
	--{
	--	"EdenEast/nightfox.nvim", -- carbonfox, nightfox
	--	lazy = false,
	--	priority = 1000,
	--	config = function()
	--		require("nightfox").setup({
	--			options = {
	--				transparent = false, -- Disable setting background
	--				terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
	--				dim_inactive = false, -- Non focused panes set to alternative background
	--				module_default = true, -- Default enable value for modules
	--				styles = { -- Style to be applied to different syntax groups
	--					comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
	--					conditionals = "italic",
	--					constants = "bold",
	--					functions = "italic,bold",
	--					keywords = "bold",
	--					numbers = "bold",
	--					operators = "NONE",
	--					strings = "NONE",
	--					types = "NONE",
	--					variables = "NONE",
	--				},
	--				inverse = { -- Inverse highlight for different types
	--					match_paren = false,
	--					visual = false,
	--					search = false,
	--				},
	--				modules = { -- List of various plugins and additional options
	--					-- ...
	--				},
	--			},
	--			palettes = {},
	--			specs = {},
	--			groups = {},
	--		})

	--		-- setup must be called before loading
	--		vim.cmd("colorscheme zephyrium") -- zephyr, nightfox, earlysummer, darker, ferrum, system76, enfocado, aurora
	--	end,
	--},
	-- { "lunarvim/colorschemes", lazy = false },
	-- { "lunarvim/darkplus.nvim", lazy = false },
	{ "tanvirtin/nvim-monokai", lazy = false },
	-- { "wuelnerdotexe/vim-enfocadoj", lazy = false },
	-- { "titanzero/zephyrium", lazy = false, priority = 1000 },
	-- { "glepnir/zephyr-nvim", lazy = false, priority = 1000 },
	-- { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
	-- { "marko-cerovac/material.nvim", lazy = false, priority = 1000 }, -- material-darker
	{ "askfiy/visual_studio_code", lazy = false, priority = 1000 },
	-- { "folke/tokyonight.nvim", lazy = false, priority = 1000 }, -- tokyonight-night
}
