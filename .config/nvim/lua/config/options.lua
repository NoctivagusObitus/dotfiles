-- tab / indentation
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.softtabstop = 2 -- how many spaces is tabstop in insert mode
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- autoindent new lines
vim.opt.showtabline = 2 -- always show tabs

-- list characters (non visible chars)
vim.opt.listchars = {
	eol = "↲", -- linebreak char
	precedes = "<", -- no line wrap previous char (», ›)
	extends = ">", -- no line wrap following char («, ‹)
	nbsp = "␣",
	trail = "·", -- trailing whitespaces
	lead = "·", -- leading whitespaces
	tab = "> ",
	space = ".",
}
vim.opt.list = true
vim.opt.wrap = false

--vim.opt.expandtab = true    -- convert tabs to spaces
--vim.bo.autoindent = true

-- search
vim.opt.incsearch = true -- highlight all the matches
vim.opt.ignorecase = true -- match lower case and upper case by typing lower case
vim.opt.smartcase = true -- case sensitivity if used uper case in search
vim.opt.hlsearch = true -- highlight all occurences

-- appearance
vim.opt.number = true -- have line numbers
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.colorcolumn = "100" -- line lenght marker at 80 columns
vim.opt.signcolumn = "yes" -- additional space for debugger symboles
vim.opt.cmdheight = 1 -- how much space for : commands
vim.opt.completeopt = "menuone,noinsert,noselect" -- mostly just for cmp
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.cursorline = true -- highlight the current line

-- behavior
vim.opt.hidden = true -- enable background buffers
vim.opt.undofile = true
vim.opt.undodir = "/tmp/nvim/undo" -- fn.stdpath('config') .. '/undodir'
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus") -- allows neovim to access the system clipboard
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.showmatch = true -- highlight matching parenthesis
vim.opt.splitright = true -- vertical split to the right
vim.opt.splitbelow = true -- horizontal split to the bottom
vim.opt.lazyredraw = true -- faster scrolling

-- hide redundant information with statusbar but always show statusbar
vim.o.showmode = false
vim.o.showcmd = false
vim.o.ruler = false
vim.o.laststatus = 2

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "auto:9"
vim.wo.foldnestmax = 10
vim.wo.foldminlines = 4
-- on file open, open all folds up to specefied level
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.wo.foldlevel = 5
	end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
	desc = "Briefly highlight yanked text",
})
