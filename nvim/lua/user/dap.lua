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

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
		target = "arm64",
		-- 💀
		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		-- runInTerminal = false,
	},
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp






vim.keymap.set("n", "<Leader><Right>",         ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader><Up>",            ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<Leader><Down>",          ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<Leader><Left>",          ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>b",               ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>B",               ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>lp",              ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<Leader>dr",              ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<Leader>dl",              ":lua require'dap'.run_last()<CR>")
