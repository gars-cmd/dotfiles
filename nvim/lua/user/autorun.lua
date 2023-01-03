local attach_to_buffer = function(output_bufnr, pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("AutoRunFile", { clear = true }),
        pattern = pattern, --define a pattern for which fiel will do the autorun
        callback = function()
            local append_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
                end
            end
            vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "===================",
                "running_file output: ",
                "===================" })
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end,
    })
end


attach_to_buffer(31, "*.py", { "python3", "main.py" })
vim.api.nvim_create_user_command("AutoRun", function()
    print "AutRun start now... "
    local bufnr = vim.fn.input "Bufnr: "
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


    --[[ local pattern = vim.fn.input "pattern: " ]]
    --[[ local command = vim.split(vim.fn.input "command: ", " ") ]]
    attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})
