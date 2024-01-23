-- return {
--         "almo7aya/neogruvbox.nvim",
--         lazy = false,
--         name = "neogruvbox",
--         priority = 1000,
--         config =  function ()
--             vim.cmd.colorscheme("neogruvbox")
--         end
-- }

return {
    "sainnhe/sonokai",
    lazy = false,
    name = "sonokai",
    priority = 1000,
    config = function ()
        vim.cmd("let g:sonokai_style = 'espresso'")
        vim.cmd("let g:sonokai_enable_italic_comment = 1")
        vim.cmd.colorscheme("sonokai")
    end
}


-- return {
--     "zootedb0t/citruszest.nvim",
--     lazy = false,
--     name = "citruszest",
--     priority = 1000,
--     config = function ()
--         vim.cmd.colorscheme("citruszest")
--     end
-- }

