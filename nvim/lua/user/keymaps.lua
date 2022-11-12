local opts = { noremap = true, silent = true }
--[[ local term_opts = { silent = true } ]]
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
--vim.g.mapleader = " "
--vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- Resize with arrows

-- Normal --
-- -- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
-- Visual Block --

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap(
	"n",
	"<A-f>",
	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>",
	opts
)
keymap(
	"n",
	"<A-g>",
	"<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({}))<cr>",
	opts
)

--nvim-tree
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts)
keymap("n", "<C-h>", ":NvimTreeFocus<cr>", opts)

-- hop
keymap("n", "<A-w>", "<cmd>lua require'hop'.hint_words()<cr>", opts) --move the cursor to a specific word
keymap("n", "<A-l>", "<cmd>lua require'hop'.hint_vertical()<cr>", opts) --move the cursor in a vertical line
keymap("n", "gf", "<cmd>lua vim.lsp.buf.format()<cr>", opts) -- key binding to activate formatting of the code

keymap("n", "gt" , ":TroubleToggle<cr>" , opts)

-- keymap for symbols-outlines plugin 
keymap("n" , "<C-t>" ,":SymbolsOutline<cr>",opts)
