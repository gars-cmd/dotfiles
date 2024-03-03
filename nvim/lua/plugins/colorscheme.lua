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

-- return {
--     "EdenEast/nightfox.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         vim.cmd.colorscheme("terafox")
--     end
-- }

-- return {
--     "tiagovla/tokyodark.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         vim.cmd.colorscheme("tokyodark")
--     end
-- }

return {
	"sam4llis/nvim-tundra",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.tundra_biome = "alpine"
		vim.opt.background = "dark"
		vim.cmd.colorscheme("tundra")
	end,
}

-- return {
--     "phha/zenburn.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         require("zenburn").setup()
--         vim.cmd.colorscheme("zenburn")
--     end
-- }

-- return {
--     "kihachi2000/yash.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         vim.cmd.colorscheme("yash")
--     end
-- }

-- return {
--     "rose-pine/neovim",
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         vim.cmd.colorscheme("rose-pine-moon")
--     end
-- }

-- return {
--     'Yazeed1s/oh-lucy.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         vim.cmd.colorscheme("oh-lucy")
--     end
-- }

-- return {
--     "alexmozaidze/palenight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function ()
--         vim.cmd.colorscheme("palenight")
--     end
-- }

-- return {
--   "AlexvZyl/nordic.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("nordic").setup({
--             -- Recommended - see "Configuring" below for more config options
--             cursorline = {
--                 bold_number = true
--             },
--             bold_keywords = true,
--             italic_comments = true,
--             reduced_blue = true,
--             swap_backgrounds = true,
--             telescope = {
--                 style = 'flate' -- flat or classic
--             }
--         })
--         vim.cmd("colorscheme nordic") -- set the colorscheme
--     end,
-- }

-- return {
--     "roobert/palette.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("palette").setup({})
--         vim.cmd("colorscheme palette") -- set the colorscheme
--     end,
-- }

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
