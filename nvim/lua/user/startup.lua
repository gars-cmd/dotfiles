-- open telescope when neovim starts (from Adib Hanna)
vim.api.nvim_create_autocmd("VimEnter",{
    callback = function ()
        vim.cmd("silent! lua require('telescope.builtin').find_files()")
    end,
})
