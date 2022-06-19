local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("lspconfig broken")
	return
end

require("markus.lsp.lsp-installer")
require("markus.lsp.handlers").setup()
require("markus.lsp.null-ls")
