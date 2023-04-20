local lsp = require('lsp-zero')

--[[ lsp.preset('recommended') ]]
lsp.set_preferences({
    suggest_lsp_servers    = true,
    setup_servers_on_start = true,
    set_lsp_keymaps        = true,
    configure_diagnostics  = true,
    cmp_capabilities       = true,
    manage_nvim_cmp        = false,
    call_servers           = 'local',
    sign_icons             = {
        error = '',
        warn  = '',
        hint  = '',
        info  = ''
    }
})

lsp.on_attach(function(client,bufnr)
local opts = {buffer = bufnr, remap = false}

vim.keymap.set("n", "gd" , function () vim.lsp.buf.definition() end,opts)
vim.keymap.set("n", "K" , function () vim.lsp.buf.hover() end,opts)
vim.keymap.set("n", "<leader>vws" , function () vim.lsp.buf.workspace_symbol() end,opts)
vim.keymap.set("n", "<leader>d" , function () vim.diagnostic.open_float() end,opts)
vim.keymap.set("n", "[d" , function () vim.diagnostic.goto_prev() end,opts)
vim.keymap.set("n", "]d" , function () vim.diagnostic.goto_next() end,opts)
vim.keymap.set("n", "<leader>ca" , function () vim.lsp.buf.code_action() end,opts)
vim.keymap.set("n", "<leader>rr" , function () vim.lsp.buf.references() end,opts)
vim.keymap.set("n", "<leader>rn" , function () vim.lsp.buf.rename() end,opts)
vim.keymap.set("n", "<leader>e" , function () vim.diagnostic.open_float() end,opts)
end)

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text     = true,
    signs            = true,
    update_in_insert = false,
    underline        = true ,
    severity_sort    = false,
    float            = true,
})


