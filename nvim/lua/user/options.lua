local options = {
  backup = false,				             --create backup of the file
  clipboard = "unnamedplus",      	     -- allows neovim to access the system clipboard
  cmdheight = 2,                		     -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                            -- display lines as one long line
  scrolloff = 8,
  sidescrolloff = 8,
  termguicolors = true,                    -- set term gui colors 
}


vim.opt.shortmess:append "c"


for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]



-- Modify from the theme the color of the num line  && the background color of nvim-tree
vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight LineNr guibg=NONE guifg=#FBAE3C "modify the color of the number line"
autocmd ColorScheme * highlight NvimTreeNormal guibg=NONE " tree-nvim background to none "
autocmd ColorScheme * highlight Pmenu guibg=#001220  guifg=#FBAE3C" color of the cmp-nvim menu background to none
autocmd ColorScheme * highlight FloatBorder guibg=NONE guifg=#FBAE3C "color of the border and the background of the border
autocmd ColorScheme * highlight Normal  guibg=#001220 "override the theme background 
autocmd ColorScheme * highlight NonText guibg=#001220 "override the theme background 

" autocmd ColorScheme * highlight cursorline guibg=none
augroup end
]])

