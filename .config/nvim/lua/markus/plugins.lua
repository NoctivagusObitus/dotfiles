local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("packer broken")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"  -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"  -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  --use "moll/vim-bbye"
  --use "akinsho/toggleterm.nvim"
  --use "ahmedkhalf/project.nvim"
  --use "lewis6991/impatient.nvim"
  --use "goolord/alpha-nvim"

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "tanvirtin/nvim-monokai"
  use "wuelnerdotexe/vim-enfocado"
  use "glepnir/zephyr-nvim"
  use { 'ray-x/starry.nvim', setup = function()
    vim.g.starry_italic_comments = false
    vim.g.starry_italic_string = false
    vim.g.starry_italic_keywords = true
    vim.g.starry_italic_functions = true
    vim.g.starry_italic_variables = false
    vim.g.starry_contrast = true
    vim.g.starry_borders = false
    vim.g.starry_disable_background = false --set to true to disable background and allow transparent background
    vim.g.starry_style_fix = true           --disable random loading
    --vim.g.starry_style="moonlight"  --load moonlight everytime or
    vim.g.starry_darker_contrast = true     --darker background
    vim.g.starry_deep_black = false         --"OLED deep black
    vim.g.starry_set_hl = true              --" Note: enable for nvim 0.6+, it is faster (loading time down to 4~6s from 7~11s), but it does
    -- not overwrite old values and may has some side effects
    vim.g.starry_daylight_switch = false    --"this allow using brighter color
    -- other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
  end }

  -- cmp plugins
  use "hrsh7th/nvim-cmp"         -- The completion plugin
  use "hrsh7th/cmp-buffer"       -- buffer completions
  use "hrsh7th/cmp-path"         -- path completions
  use "hrsh7th/cmp-cmdline"      -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    run = "make install_jsregexp"
  }                                  --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup {}
    end,
  }
  use {
    "williamboman/mason.nvim", -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  }
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use 'MunifTanjim/prettier.nvim'
  use 'towolf/vim-helm'
  use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim", "hrsh7th/vim-vsnip" } }) -- scala
  use 'mfussenegger/nvim-jdtls'

  -- formatting and stuff
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "ckipp01/stylua-nvim"

  -- testing
  use { "klen/nvim-test", config = function()
    require('nvim-test').setup()
  end
  }

  -- debugging
  use 'simrat39/rust-tools.nvim'
  use 'mfussenegger/nvim-dap'
  use 'Pocco81/DAPInstall.nvim'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'leoluz/nvim-dap-go'
  use 'mfussenegger/nvim-dap-python'
  --use {
  --  'yriveiro/dap-go.nvim',
  --  requires = { {'nvim-lua/plenary.nvim'} }
  --}

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- arbitrary tooling
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "HiPhish/nvim-ts-rainbow2"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
