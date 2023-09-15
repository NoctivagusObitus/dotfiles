require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup()

require("lspconfig").bashls.setup {}
require("lspconfig").dockerls.setup {}
require("lspconfig").gopls.setup {
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
}
require("lspconfig").jdtls.setup {}
require("lspconfig").jsonnet_ls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").sqlls.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").yamlls.setup {
  settings = {
    yaml = {
      format = {
        enable = false,
        bracketSpacing = false,
        printWidth = 90,
      },
      keyOrdering = false,
      hover = true,
      validate = true,
      completion = true,
      schemaStore = {
        url = "https://www.schemastore.org/api/json/catalog.json",
        enable = true,
      },
      schemas = {
        ["kubernetes"] = "/*k8s.yaml",
      },
    },
  },
}

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
