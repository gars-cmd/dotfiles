--[[]]
------------------------ ROSE-PINE -------------------------
--[[ require('rose-pine').setup({ ]]
--[[ 	dark_variant = 'dawn', ]]
--[[ 	disable_background = true, ]]
--[[]]
--[[ }) ]]
--[[ vim.cmd('colorscheme rose-pine') ]]


--[[ ------------------------ TUNDRA ------------------------- ]]
--[[]]
--[[ require('nvim-tundra').setup({}) ]]
--[[ vim.opt.background = 'dark' ]]
--[[ vim.cmd('colorscheme tundra') ]]
--[[]]
--[[]]
------------------------ NORDIC -------------------------
--[[]]
--[[ require 'nordic' .setup { ]]
--[[     bold_keywords = true, ]]
--[[     -- Enable italic comments. ]]
--[[     italic_comments = true, ]]
--[[     -- Enable general editor background transparency. ]]
--[[     transparent_bg = false, ]]
--[[     -- Enable brighter float border. ]]
--[[     bright_border = true, ]]
--[[ } ]]
--[[ vim.cmd('colorscheme nordic') ]]
--

--[[ CATPUCCIN-LATTE ]]
--[[ require("catppuccin").setup({ ]]
--[[     flavour = "latte", -- latte, frappe, macchiato, mocha ]]
--[[     background = { -- :h background ]]
--[[         light = "latte", ]]
--[[         dark = "mocha", ]]
--[[     }, ]]
--[[ }) ]]
--[[ vim.cmd('colorscheme catppuccin') ]]


 --[[ KANAGAWA ]]
require('kanagawa').setup({
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
-- setup must be called before loading
vim.cmd("colorscheme kanagawa-lotus")
