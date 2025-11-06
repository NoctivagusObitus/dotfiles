return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- Allows extra capabilities provided by nvim-cmp
		"folke/neoconf.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
}
