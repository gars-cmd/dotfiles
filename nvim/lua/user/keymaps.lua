local opts = {
    noremap = true,
    silent = true,
    nowait = false,
    buffer = nil,
}
--[[ local term_opts = { silent = true } ]]
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

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

-- it's like to do [ <- ] at every start line bellow
keymap("n", "J", "mzJ`z", opts)

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

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
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)


-- ThePrimeagen tip to center CTRL u (go half up) and CTRL d (go half down)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)

-- ThePrimeagen tip to center the view of search results
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- ThePrimeagen tip to keep what is in the yank register after deleting
keymap("x", "<leader>p", "\"_dP", opts)


-- yank into the system register
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+y", opts)

-- Telescope
keymap(
    "n",
    "<A-f>",
    "<cmd>lua require'telescope.builtin'.find_files()<cr>",
    opts
)
keymap(
    "n",
    "<A-g>",
    "<cmd>lua require'telescope.builtin'.live_grep()<cr>",
    opts
)
keymap(
    "n",
    "<A-k>",
    "<cmd>lua require'telescope.builtin'.keymaps()<cr>",
    opts
)
keymap(
    "n",
    "<A-s>",
    "<cmd>lua require'telescope.builtin'.treesitter()<cr>",
    opts
)

--local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<A-k>', builtin.keymaps, {})
-- vim.keymap.set('n', '<A-f>', builtin.find_files, {})
-- vim.keymap.set('n', '<A-g>', builtin.live_grep, {})

--nvim-tree
--[[ keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts) ]]
--[[ keymap("n", "<C-h>", ":NvimTreeFocus<cr>", opts) ]]

 -- Open explorer
keymap("n", "<C-n>", ":Ex<cr>", opts)

-- hop
keymap("n", "<A-w>", "<cmd>lua require'hop'.hint_words()<cr>", opts)    --move the cursor to a specific word
keymap("n", "<A-l>", "<cmd>lua require'hop'.hint_vertical()<cr>", opts) --move the cursor in a vertical line
keymap("n", "gf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)            -- key binding to activate formatting of the code

-- Trouble 
keymap("n", "gt", ":TroubleToggle<cr>", opts)

-- keymap for symbols-outlines plugin
keymap("n", "<A-t>", ":SymbolsOutline<cr>", opts)

--keymaps for toggleterm
--[[ keymap("n", "<C-t>", ":ToggleTerm<cr>", opts) ]]

