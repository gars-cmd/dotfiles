local opts = {
    noremap = true,
    silent = true,
    nowait = false,
    buffer = nil,
}


local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

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
keymap("v", "J", ":move '>+1<CR>gv=gv", opts)
keymap("v", "K", ":move '<-2<CR>gv=gv", opts)


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

 -- Open explorer
keymap("n", "<C-n>", ":Ex<cr>", opts)

-- Play sound file the cursor is on
keymap("n", "<leader>ps", ":call jobstart('aplay ' . expand('<cWORD>'))<CR>", opts)
keymap("n", "<leader>pi", ":call jobstart('feh -x ' . expand('<cWORD>'))<CR>", opts)


-- HARPOON --
