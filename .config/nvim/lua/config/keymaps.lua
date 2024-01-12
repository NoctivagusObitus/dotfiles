local keymap = vim.keymap
local function opts(desc)
	local tmp = { noremap = true, silent = true }
	if desc then
		tmp.desc = desc
	end
	return tmp
end

--keymap("", "<Space>", "<Nop>", opts())
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- bufferline
keymap.set("n", "gb", ":BufferLinePick<CR>", opts("bufferline picker"))

-- set foldlevel
keymap.set("n", "<leader>1", ":set foldlevel=0<CR>", opts("set foldlevel of 0"))
keymap.set("n", "<leader>2", ":set foldlevel=1<CR>", opts("set foldlevel of 1"))
keymap.set("n", "<leader>3", ":set foldlevel=2<CR>", opts("set foldlevel of 2"))
keymap.set("n", "<leader>4", ":set foldlevel=3<CR>", opts("set foldlevel of 3"))
keymap.set("n", "<leader>5", ":set foldlevel=4<CR>", opts("set foldlevel of 4"))
keymap.set("n", "<leader>0", ":set foldlevel=99<CR>", opts("set highest foldlevel"))

-- Normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts()) -- navigate left
keymap.set("n", "<C-j>", "<C-w>j", opts()) -- navigate down
keymap.set("n", "<C-k>", "<C-w>k", opts()) -- navigate up
keymap.set("n", "<C-l>", "<C-w>l", opts()) -- navigate right

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize +2<CR>", opts())
keymap.set("n", "<C-Down>", ":resize -2<CR>", opts())
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts())
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts())

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", opts())
keymap.set("n", "<S-h>", ":bprevious<CR>", opts())

-- Insert --
-- Press jk fast to enter
--keymap.set("i", "jk", "<ESC>", opts())

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts())
keymap.set("v", ">", ">gv", opts())

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==", opts())
keymap.set("v", "<A-k>", ":m .-2<CR>==", opts())
keymap.set("v", "p", '"_dP', opts()) -- when in visual and paste then keep value in register

-- Visual Block --
-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts())
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts())
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts())
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts())

-- Terminal --
-- Better terminal navigation
--local term_opts = { silent = true }

--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts())
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts())
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts())
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts())

-- Command --
-- Menu navigation
--keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
--keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )
