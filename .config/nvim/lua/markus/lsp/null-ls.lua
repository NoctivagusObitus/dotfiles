local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

null_ls.setup {
  debug = false,
  debounce = 150,
  save_after_format = false,
  sources = {
    formatting.prettier.with { extra_args = {} },
    formatting.black.with { extra_args = { "--fast" } },
    --formatting.gofmt,
    formatting.isort,
    --formatting.rustfmt,
    formatting.shfmt,
    formatting.sql_formatter,
    formatting.yamlfmt,
    formatting.xmlformat,

    diagnostics.flake8,
    diagnostics.mypy,
    diagnostics.yamllint,
    diagnostics.write_good,
    diagnostics.codespell,
    diagnostics.hadolint,
    with_diagnostics_code(diagnostics.shellcheck),
    --diagnostics.semgrep.with({
    --  extra_args = { "--config", "auto" }
    --}),

    -- code actions
    code_actions.gitsigns,
    code_actions.gitrebase,
    code_actions.proselint,

    --null_ls.builtins.hover.dictionary,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
}
