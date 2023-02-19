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
require("lspconfig").gopls.setup {}
require("lspconfig").jsonnet_ls.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").sqlls.setup {}
require("lspconfig").sqls.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").yamlls.setup {}

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").sumneko_lua.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
