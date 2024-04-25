vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number relativenumber")
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 8
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.splitright = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.backup = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.background = "dark"
vim.opt.cmdheight = 0
vim.opt.path:append '**'
vim.opt.wildmenu = true
-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true



