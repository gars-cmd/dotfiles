local attach_to_buffer = function(pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("AutoRunFile", { clear = true }),
        pattern = pattern,
        callback = vim.schedule_wrap(function()
            -- get dimensions
            local width = vim.api.nvim_get_option("columns")
            local height = vim.api.nvim_get_option("lines")

            -- calculate our floating window size
            local win_height = math.ceil(height * 0.8 - 4)
            local win_width = math.ceil(width * 0.8)

            -- and its starting position
            local row = math.ceil((height - win_height) / 2 - 1)
            local col = math.ceil((width - win_width) / 2)

            -- create a buffer to write into
            local buff = vim.api.nvim_create_buf(false, true)

            -- to be deleted when hidden
            vim.api.nvim_buf_set_option(buff, "bufhidden", "wipe")

            local win_id = vim.api.nvim_open_win(buff, true, {
                relative = "editor",
                border = "rounded",
                style = "minimal",
                width = win_width,
                height = win_height,
                row = row,
                col = col,
            })
            vim.api.nvim_buf_set_keymap(
                buff,
                "n",
                "<Esc>",
                "<Cmd>lua vim.api.nvim_win_close(" .. win_id .. ", true)<CR>",
                { noremap = true, silent = true }
            )
            local function append_data(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(buff, -1, -1, false, data)
                end
            end
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end),
    })
end

vim.api.nvim_create_user_command("AutoRun", function()
    print("AutoRun start now... ")
    --[[ local filename  = vim.api.nvim_call_function("bufname", {}) ]]
    --[[ local extension = string.match(filename, "%.([^%.]*)$") ]]
    --[[ local pattern   = "*." .. extension ]]
    --[[ local command ]]
    --[[ if pattern     == "*.py" then ]]
    --[[     command    = { "python3", filename } ]]
    --[[ elseif pattern == "*.java" then ]]
    --[[     command    = { "java", filename } ]]
    --[[ elseif pattern == "*.sh" then ]]
    --[[     command    = { "bash", filename } ]]
    --[[ elseif pattern == "*.js" or pattern == "*.ts" then ]]
    --[[     command    = { "node", filename } ]]
    --[[ elseif pattern == "*.c" or pattern == "*.h" or pattern == "*.cpp" then ]]
    --[[     command = {"make", "run"} ]]
    --[[ else ]]
    --[[     pattern    = vim.fn.input "pattern: " ]]
    --[[     command    = vim.fn.input "command: " ]]
    --[[ end ]]
    local pattern = ""
    local command = "./build.sh"
    attach_to_buffer(pattern, command)
end, {})
