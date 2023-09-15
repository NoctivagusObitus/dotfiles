require("nvim-treesitter.configs").setup {
  -- install all supported languages
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    --disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

    --custom_captures = {
    --  ["punctuation.bracket"] = "",
    --  ["constructor"] = "",
    --},
  },
  indent = {
    enable = true,
    --disable = { "yaml" } -- disable for certain files
  },
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { "jsx", "cpp" },
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require 'ts-rainbow.strategy.global',
    -- Do not enable for files with more than n lines
    max_file_lines = 3000
  } }
