require("which-key").register({
  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "goto declaration" },
  ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "goto definition" },
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
  ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
  ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signiture help" },
  ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "references" },
  ["[d"] = { '<cmd>lua vim.lsp.buf.goto_prev({ border = "rounded" })<CR>', "goto preview" },
  ["gl"] = { '<cmd>lua vim.lsp.buf.show_line_diagnostics({ border = "rounded" })<CR>', "line diagnostics" },
  ["]d"] = { '<cmd>lua vim.lsp.buf.goto_next({ border = "rounded" })<CR>', "goto next" },
  ["<leader>q"] = { '<cmd>lua vim.lsp.buf.setloclist()<CR>', "set local list" },
})

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("lsp config broken")
  return
end

require("markus.lsp.helm")
require("markus.lsp.mason")
require("markus.lsp.handlers").setup()
require("markus.lsp.null-ls")
require("markus.lsp.metals")
require("markus.lsp.rust-tools")
--require("markus.lsp.jdtls")
