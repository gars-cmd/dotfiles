
vim.opt.list = false
--[[ vim.opt.listchars:append "eol:↴" ]]
--[[ vim.opt.listchars:append "tab:" ]]

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
