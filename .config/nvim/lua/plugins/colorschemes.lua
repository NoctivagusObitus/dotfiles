return {
	-- vim.api.nvim_set_option_value("background", "dark", {})
	-- onehalf-lush-dark, tomorrow, zephyr, zephyrium, nightfox, monokai, earlysummer, darker, ferrum, system76, enfocado, aurora
	{ "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
	{ "CodeGradox/onehalf-lush", lazy = false, priority = 1000 }, -- no auto light/dark switching
	{ "uloco/bluloco.nvim", lazy = false, priority = 1000, dependencies = { "rktjmp/lush.nvim" } }, -- to few colors (Bash vars look like keywords)
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
			})

			vim.cmd("colorscheme catppuccin") -- lightd/dark depending on terminal
		end,
	},
	-- { -- no auto switching between light and dark
	-- 	"marko-cerovac/material.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("material").setup({
	-- 			plugins = {
	-- 				"dap",
	-- 				"fidget",
	-- 				"gitsigns",
	-- 				"nvim-cmp",
	-- 				"nvim-tree",
	-- 				"nvim-web-devicons",
	-- 				"rainbow-delimiters",
	-- 				"telescope",
	-- 			},

	-- 			high_visibility = { lighter = true, darker = true },
	-- 		})
	-- 	end,
	-- },
	--{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} }, -- bad light theme
	-- {
	-- 	"Shatur/neovim-ayu",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("ayu").setup({
	-- 			mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	-- 			terminal = false, -- Set to `false` to let terminal manage its own colors.
	-- 			overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
	-- 		})
	-- 	end,
	-- },
	-- { "EdenEast/nightfox.nvim", lazy = false, priority = 1000 }, -- only ad light themes
	-- { "lunarvim/colorschemes", lazy = false },
	-- { "lunarvim/darkplus.nvim", lazy = false },
	-- { "tanvirtin/nvim-monokai", lazy = false },
	-- { "wuelnerdotexe/vim-enfocadoj", lazy = false },
	-- { "titanzero/zephyrium", lazy = false, priority = 1000 },
	-- { "glepnir/zephyr-nvim", lazy = false, priority = 1000 },
	-- { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
}
