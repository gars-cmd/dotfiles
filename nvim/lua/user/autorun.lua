
local attach_to_buffer = function(pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("AutoRunFile", { clear = true }),
        pattern = pattern,
        callback = function()
            --[[ local win_id = vim.api.nvim_get_current_win() ]]
            local curr_width = vim.api.nvim_win_get_width(0) or 100
            local curr_height =vim.api.nvim_win_get_height(0) or 100
            local new_buff = vim.api.nvim_create_buf(false, true)
            local win_id = vim.api.nvim_open_win(new_buff, true, {
            relative = "editor",
            width = math.floor(curr_width * 0.5),
            height = math.floor(curr_height * 0.5),
            row = 0,
            col = 0,
            border = "rounded",
            style = "minimal",
            })
            vim.api.nvim_set_current_win(win_id)
            local function append_data(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(new_buff, -1, -1, false, data)
                end
            end
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end,
    })
end

--[[ attach_to_buffer("*.py", { "python3", "main.py" }) ]]
vim.api.nvim_create_user_command("AutoRun", function()
    print "AutoRun start now... "
    local filename = vim.api.nvim_call_function("bufname", {})
    local extension = string.match(filename, "%.([^%.]*)$")
    local pattern = "*." .. extension
    local command
    if pattern == "*.py" then
        command = { "python3", filename }
    elseif pattern == "*.java" then
        command = { "java", filename }
    elseif pattern == "*.sh" then
        command = { "bash", filename }
    elseif pattern == "*.js" or pattern == "*.ts" then
        command = { "node", filename }
    else
        pattern = vim.fn.input "pattern: "
        command = vim.fn.input "command: "
    end
    attach_to_buffer(pattern, command)
end, {})
