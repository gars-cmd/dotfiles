local dap = require('dap')

require("dapui").setup()

require("mason-nvim-dap").setup({
    automatic_setup = true,
    handlers = {},
})

local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end






vim.keymap.set("n", "<Leader><Right>",         ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader><Up>",            ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<Leader><Down>",          ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<Leader><Left>",          ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>b",               ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>B",               ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>lp",              ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<Leader>dr",              ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<Leader>dl",              ":lua require'dap'.run_last()<CR>")
