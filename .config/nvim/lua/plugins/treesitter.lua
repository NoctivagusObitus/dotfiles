return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = "false",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
	},
}
