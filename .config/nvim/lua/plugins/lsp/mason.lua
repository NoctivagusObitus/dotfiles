return {
	-- Automatically install LSPs and related tools to stdpath for Neovim
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		-- mason-lspconfig:
		-- - Bridges the gap between LSP config names (e.g. "lua_ls") and actual Mason package names (e.g. "lua-language-server").
		-- - Used here only to allow specifying language servers by their LSP name (like "lua_ls") in `ensure_installed`.
		-- - It does not auto-configure servers — we use vim.lsp.config() + vim.lsp.enable() explicitly for full control.
		"mason-org/mason-lspconfig.nvim",
		-- mason-tool-installer:
		-- - Installs LSPs, linters, formatters, etc. by their Mason package name.
		-- - We use it to ensure all desired tools are present.
		-- - The `ensure_installed` list works with mason-lspconfig to resolve LSP names like "lua_ls".
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-nvim-dap").setup({
			handlers = {}, -- sets up dap in the predefined manner
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"bash-debug-adapter",
				"bashls",
				"black",
				"buf",
				"codelldb",
				"codespell",
				"cpplint",
				"debugpy",
				"delve",
				"docker-compose-language-service",
				"dockerls",
				"editorconfig-checker",
				"eslint_d",
				"eslint-lsp",
				"flake8",
				"gofumpt",
				"golines",
				"gomodifytags",
				"google-java-format",
				"gopls",
				"gotests",
				"graphql",
				"hadolint",
				"html",
				"isort",
				"java-debug-adapter",
				"java-test",
				"jdtls",
				"jsonnet_ls",
				"lua_ls",
				"marksman",
				"mypy",
				"prettier",
				"prismals",
				"proselint",
				"pylint",
				"pyright",
				"semgrep",
				"shellcheck",
				"shellharden",
				"shfmt",
				"sql-formatter",
				"sqlls",
				"staticcheck",
				"stylua",
				"ts-standard",
				"typescript-language-server",
				"write-good",
				"xmlformatter",
				"yamlfmt",
				"yamllint",
				"yamlls",
			},

			-- if set to true this will check each tool for updates. If updates
			-- are available the tool will be updated. This setting does not
			-- affect :MasonToolsUpdate or :MasonToolsInstall.
			-- Default: false
			auto_update = false,

			-- automatically install / update on startup. If set to false nothing
			-- will happen on startup. You can use :MasonToolsInstall or
			-- :MasonToolsUpdate to install tools and check for updates.
			-- Default: true
			run_on_start = true,

			-- set a delay (in ms) before the installation starts. This is only
			-- effective if run_on_start is set to true.
			-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
			-- Default: 0
			start_delay = 3000, -- 3 second delay

			-- Only attempt to install if 'debounce_hours' number of hours has
			-- elapsed since the last time Neovim was started. This stores a
			-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
			-- This is only relevant when you are using 'run_on_start'. It has no
			-- effect when running manually via ':MasonToolsInstall' etc....
			-- Default: nil
			debounce_hours = 5, -- at least 5 hours between attempts to install/update
		})
	end,
}
