
vim.opt.list = true
--[[ vim.opt.listchars = { tab = ' >'} ]]
--[[ vim.opt.listchars:append({ tab = "> "}) ]]
vim.opt.listchars:append "tab: "

require("indent_blankline").setup {
    enabled = true,
    show_current_context = true,
    show_current_context_start = true,
}
