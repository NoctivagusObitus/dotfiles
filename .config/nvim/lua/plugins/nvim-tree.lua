return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- as the docs say:
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- nvim-tree
		vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", { noremap = true, silent = true })

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			-- enable default key mappings
			api.config.mappings.default_on_attach(bufnr)
			-- add / overwrite with additional custom key mappings
			vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "A", function()
				local node = api.tree.get_node_under_cursor()
				print(node.absolute_path)
			end, opts("Print Node Path"))
		end

		require("nvim-tree").setup({
			disable_netrw = true,
			hijack_netrw = true,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			git = {
				enable = true,
			},
			filters = {
				git_ignored = false,
			},
			diagnostics = {
				enable = true,
			},
			-- this one is important to set keymaps in nvim-tree buffer onl
			on_attach = my_on_attach,
		})

		-- open treesitter at startup when only choosing directory
		local function open_nvim_tree(data)
			-- buffer is a directory
			local directory = vim.fn.isdirectory(data.file) == 1

			if not directory then
				return
			end

			-- change to the directory
			vim.cmd.cd(data.file)

			-- open the tree
			require("nvim-tree.api").tree.open()
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
	end,
}
