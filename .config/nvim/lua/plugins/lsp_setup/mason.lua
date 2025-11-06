return {
  {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- mason-lspconfig:
    -- - Bridges the gap between LSP config names (e.g. "lua_ls") and actual Mason package names (e.g. "lua-language-server").
    -- - Used here only to allow specifying language servers by their LSP name (like "lua_ls") in `ensure_installed`.
    -- - It does not auto-configure servers — we use vim.lsp.config() + vim.lsp.enable() explicitly for full control.
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
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

      --require("mason-lspconfig").setup({})
    end,
  },
  {
    -- mason-tool-installer:
    -- - Installs LSPs, linters, formatters, etc. by their Mason package name.
    -- - We use it to ensure all desired tools are present.
    -- - The `ensure_installed` list works with mason-lspconfig to resolve LSP names like "lua_ls".
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
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
      })

      local lsps = {
        "bashls",
        "buf_ls", -- protobuf
        "clangd",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "gopls",
        "graphql",
        "html",
        "jdtls",
        "jsonnet_ls",
        "lua_ls",
        "marksman",
        "prismals",
        "pyright",
        "ts_ls",
        "yamlls",
        yamlls,
      }
      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      for i, server in ipairs(lsps) do
        -- cfg.capabilities = vim.tbl_deep_extend("force", capabilities, cfg.capabilities or {})
        -- vim.lsp.config(server, cfg)
        vim.lsp.enable(server)
      end
    end,
  },
}
