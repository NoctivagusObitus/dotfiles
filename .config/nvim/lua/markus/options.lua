-- :help options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
--vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
--vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
--vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 15
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
--vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work


-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.g.mapleader = ';'             -- change leader to a comma
vim.o.undofile = true
--vim.opt.undofile = true                         -- enable persistent undo
vim.o.undodir = "/tmp/nvim/undo" -- fn.stdpath('config') .. '/undodir'
vim.o.incsearch = true
vim.o.backup = false
vim.bo.swapfile = false
--o.hidden = true
--opt.mouse = 'a'               -- enable mouse support
--opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
--opt.number = true             -- show line number
vim.opt.showmatch = true          -- highlight matching parenthesis
vim.opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
vim.opt.colorcolumn = '100'        -- line lenght marker at 80 columns
vim.opt.splitright = true         -- vertical split to the right
vim.opt.splitbelow = true         -- horizontal split to the bottom
--vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
--vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
--vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.ignorecase = true         -- ignore case letters when search
--vim.opt.smartcase = true          -- ignore lowercase for the whole pattern
vim.opt.linebreak = true          -- wrap on word boundary
vim.wo.breakindent = true
vim.opt.showbreak = '-> '
--vim.wo.number = true
--vim.wo.relativenumber = true
--vim.wo.signcolumn = 'yes'

-----------------------------------------------------------
-- Colorscheme / Theme
-----------------------------------------------------------
vim.opt.termguicolors = true      -- enable 24-bit RGB colors
--vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
--cmd [[colorscheme monokai]]
-- g.colors_name = 'ayu'
-- g.ayucolor = 'dark'

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true         -- enable background buffers
vim.opt.history = 100         -- remember n lines in history
vim.opt.lazyredraw = true     -- faster scrolling
vim.opt.synmaxcol = 800       -- max column for syntax highlight

-----------------------------------------------------------
-- Tabs, indent
----------------8-----------------------------------------
--vim.opt.expandtab = true                        -- convert tabs to spaces
--vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
--vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 2        -- shift 4 spaces when tab
vim.opt.softtabstop = 2        -- shift 4 spaces when tab
vim.opt.tabstop = 2           -- 1 tab == 4 spaces
vim.opt.smartindent = true    -- autoindent new lines
--vim.bo.autoindent = true
--vim.bo.smartindent = true

-- IndentLine
--vim.g.indentLine_setColors = 0  -- set indentLine color
vim.g.indentLine_char = '|'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
--cmd [[autocmd FileType markdown let g:indentLine_enabled=0]]

-- hide redundant information with statusbar but always show statusbar
--vim.o.showmode = false
--vim.o.ruler = false
--vim.o.laststatus = 2
--vim.o.showcmd = false

-- remove whitespace on save
vim.cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
--local disabled_built_ins = {
--    "netrw",
--    "netrwPlugin",
--    "netrwSettings",
--    "netrwFileHandlers",
--    "gzip",
--    "zip",
--    "zipPlugin",
--    "tar",
--    "tarPlugin",
--    "getscript",
--    "getscriptPlugin",
--    "vimball",
--    "vimballPlugin",
--    "2html_plugin",
--    "logipat",
--    "rrhelper",
--    "spellfile_plugin",
--    "matchit"
--}
--
--for _, plugin in pairs(disabled_built_ins) do
--    g["loaded_" .. plugin] = 1
--end

-- disable nvim intro
--vim.opt.shortmess:append "sI"

--vim.o.completeopt='menuone,noinsert,noselect'
