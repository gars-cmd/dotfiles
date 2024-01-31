-- return {
--         "almo7aya/neogruvbox.nvim",
--         lazy = false,
--         name = "neogruvbox",
--         priority = 1000,
--         config =  function ()
--             vim.cmd.colorscheme("neogruvbox")
--         end
-- }

-- return {
--     "sainnhe/sonokai",
--     lazy = false,
--     name = "sonokai",
--     priority = 1000,
--     config = function ()
--         vim.cmd("let g:sonokai_style = 'espresso'")
--         vim.cmd("let g:sonokai_enable_italic_comment = 1")
--         vim.cmd.colorscheme("sonokai")
--     end
-- }


return {
  "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nordic").setup({
            -- Recommended - see "Configuring" below for more config options
            cursorline = {
                bold_number = true
            },
            bold_keywords = true,
            italic_comments = true,
            reduced_blue = true,
            swap_backgrounds = true,
            telescope = {
                style = 'flate' -- flat or classic
            }
        })
        vim.cmd("colorscheme nordic") -- set the colorscheme
    end,
}



-- return{
--     "lmburns/kimbox",
--     lazy = false,
--     name = "kimbox",
--     priority = 1000,
--     config = function ()
--         require("kimbox").setup({
--             style = "burnt_coffee",
--             allow_bold = false,
--             allow_italic = true,
--             allow_underline = true,
--         })
--         vim.cmd.colorscheme("kimbox")
--     end }

