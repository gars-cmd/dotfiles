local options = {
    backup           = false,				             --create backup of the file
    clipboard        = "unnamedplus",      	     -- allows neovim to access the system clipboard
    cmdheight        = 0,                		     -- more space in the neovim command line for displaying messages
    conceallevel     = 0,                        -- so that `` is visible in markdown files
    fileencoding     = "utf-8",                  -- the encoding written to a file
    hlsearch         = false,                         -- highlight all matches on previous search pattern
    incsearch        = true,
    ignorecase       = true,                       -- ignore case in search patterns
    mouse            = "a",                             -- allow the mouse to be used in neovim
    pumheight        = 10,                          -- pop up menu height
    showtabline      = 1,                         -- always show tabs
    smartcase        = true,                        -- smart case
    smartindent      = true,                      -- make indenting smarter again
    splitbelow       = true,                       -- force all horizontal splits to go below current window
    splitright       = true,                       -- force all vertical splits to go to the right of current window
    swapfile         = false,                        -- creates a swapfile
    timeoutlen       = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile         = true,                         -- enable persistent undo
    updatetime       = 50,                        -- faster completion (4000ms default)
    writebackup      = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab        = true,                        -- convert tabs to spaces
    shiftwidth       = 4,                          -- the number of spaces inserted for each indentation
    tabstop          = 4,                             -- insert 4 spaces for a tab
    softtabstop      = 4,
    cursorline       = true,                       -- highlight the current line
    number           = true,                           -- set numbered lines
    relativenumber   = true,                   -- set relative numbered lines
    numberwidth      = 2,                         -- set number column width to 2 {default 4}
    signcolumn       = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    --[[ colorcolumn = "80", ]]
    wrap             = true,                            -- display lines as one long line
    scrolloff        = 8,
    sidescrolloff    = 8,
    termguicolors    = true,                    -- set term gui colors 
}


vim.opt.shortmess:append "c"


for k, v in pairs(options) do
    vim.opt[k] = v
end


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
--[[ vim.cmd "set guicursor=i:block" ]]



-- Modification from the theme the color of the num line  && the background color of nvim-tree
vim.cmd([[
augroup MyColors
autocmd!

" MODIFY THE COLOR OF THE NUMBER LINE"
autocmd ColorScheme * highlight LineNr         guibg=NONE guifg=#665c54

" TREE-NVIM BACKGROUND TO X"
" autocmd ColorScheme * highlight NvimTreeNormal guibg=#212529 

" COLOR OF THE NVIM-CMP
autocmd ColorScheme * highlight Pmenu          guibg=NONE

"COLOR OF THE BORDER AND THE BACKGROUND OF THE BORDER
autocmd ColorScheme * highlight FloatBorder    guibg=NONE guifg=#665c54 

"OVERRIDE THE THEME BACKGROUND 
autocmd ColorScheme * highlight Normal         guibg=NONE

"OVERRIDE THE THEME BACKGROUND 
autocmd ColorScheme * highlight NonText        guibg=NONE

"OVERRIDE THE BG OF THE CMP POPUP
autocmd ColorScheme * highlight NormalFloat    guibg=NONE
" autocmd ColorScheme * highlight PmenuSel       guibg=#778da9

" CURSOR LINE
" autocmd ColorScheme * highlight CursorLine     guibg=#778da9

"SIGN COLUMN
autocmd ColorScheme * highlight SignColumn guibg=NONE guifg=NONE

" Git 
autocmd ColorScheme * highlight GitSignsAdd guibg=NONE guifg=#98971A
autocmd ColorScheme * highlight GitSignsChange guibg=NONE guifg=#D79921
autocmd ColorScheme * highlight GitSignsDelete guibg=NONE guifg=#CC241D

" Telescope relative 
autocmd ColorScheme * highlight TelescopeNormal guibg=NONE 
autocmd ColorScheme * highlight TelescopePreviewNormal guibg=NONE 
autocmd ColorScheme * highlight TelescopePromptNormal guibg=NONE 
autocmd ColorScheme * highlight TelescopeResultsNormal guibg=NONE 
autocmd ColorScheme * highlight TelescopeSelection guibg=NONE

autocmd ColorScheme * highlight TelescopeBorder guibg=NONE guifg=#fec553
autocmd ColorScheme * highlight TelescopePromptBorder guibg=NONE guifg=#fec553
autocmd ColorScheme * highlight TelescopePreviewBorder guibg=NONE guifg=#fec553

augroup end
]])

vim.g.clipboard = {
    name = "xsel",
    copy = {
        ["+"] = "xsel --nodetach -ib",
        ["*"] = "xsel --nodetach -ip"
    },
    paste = {
        ["+"] = "xsel -ob",
        ["*"] = "xsel -op"
    },
    cache_enabled = true,
}
vim.opt.clipboard:append("unnamedplus")
