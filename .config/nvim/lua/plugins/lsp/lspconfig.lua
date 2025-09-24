return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {

		-- Allows extra capabilities provided by nvim-cmp
		"hrsh7th/cmp-nvim-lsp",

		"folke/neoconf.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap -- for conciseness
		local opts = { noremap = true, silent = true }

		-- set keybinds
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

		opts.desc = "Show LSP definitions"
		keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

		opts.desc = "Document Diagnostics"
		keymap.set("n", "<leader>ld", "<cmd>Telescope lsp_document_diagnostics<cr>", opts)

		opts.desc = "Workspace Diagnostics"
		keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_workspace_diagnostics<cr>", opts)

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		--local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		--for type, icon in pairs(signs) do
		--  local hl = "DiagnosticSign" .. type
		--  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		--end

		local lsp_confs = {}
		lsp_confs["html"] = {}

		lsp_confs["eslint"] = {}

		lsp_confs["ts_ls"] = {}

		lsp_confs["prismals"] = {}

		lsp_confs["graphql"] = {
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		}

		lsp_confs["pyright"] = {}

		lsp_confs["jdtls"] = {}

		lsp_confs["gopls"] = {
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					gofumpt = true,
					staticcheck = true,
					completeUnimported = true,
					usePlaceholders = false,
					analyses = {
						unusedparams = true,
						shadow = true,
						unusedwrite = true,
						unusedvariable = true,
					},
					codelenses = {
						generate = true, -- Don't show the `go generate` lens.
						gc_details = true, -- Show a code lens toggling the display of gc's choices.
					},
					annotations = {
						escape = true,
						inline = true,
						bounds = true,
					},
				},
			},
		}

		lsp_confs["lua_ls"] = {
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		}

		lsp_confs["bashls"] = {}

		lsp_confs["dockerls"] = {}

		lsp_confs["docker_compose_language_service"] = {}

		lsp_confs["jsonnet_ls"] = {}

		lsp_confs["clangd"] = {}

		-- protobuf
		lsp_confs["buf_ls"] = {}

		lsp_confs["marksman"] = {}

		lsp_confs["yamlls"] = {
			settings = {
				yaml = {
					redhat = { telemetry = { enabled = false } },
					format = {
						enable = false,
						bracketSpacing = false,
						printWidth = 90,
					},
					keyOrdering = false,
					hover = true,
					completion = true,
					schemaStore = {
						url = "https://www.schemastore.org/api/json/catalog.json",
						enable = true,
					},
					schemas = {
						["kubernetes"] = "/*k8s.yaml",
						["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
						["https://raw.githubusercontent.com/docker/compose/master/compose/config/compose_spec.json"] = "docker-compose*.{yml,yaml}",
						["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "argocd-application.yaml",
					},
				},
			},
		}

		for server, cfg in pairs(lsp_confs) do
			cfg.capabilities = vim.tbl_deep_extend("force", capabilities, cfg.capabilities or {})
			vim.lsp.config(server, cfg)
			vim.lsp.enable(server)
		end
	end,
}
