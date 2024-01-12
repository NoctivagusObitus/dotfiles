return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			enforce_regular_tabs = true,
			offsets = { { filetype = "NvimTree", text = "Explorer" } },
		},
	},
}
