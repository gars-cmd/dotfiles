return {
-- My plugins here
    "nvim-lua/plenary.nvim"                      ,
    "nvim-lua/popup.nvim"                        ,
    {
        "windwp/nvim-autopairs"                  , --autopair for brackets                                     , guillemet and more
        config = function()
            require("nvim-autopairs").setup({})
        end                                      ,
    }                                            ,
    {
        "numToStr/Comment.nvim"                  , --smart way to add comments
        config = function()
            require("Comment").setup()
        end                                      ,
    }                                            ,
    "karb94/neoscroll.nvim"                      , -- smooth scroll 
    "JoosepAlviste/nvim-ts-context-commentstring", --support comments for many languages
    "ryanoasis/vim-devicons"                     ,
    "lukas-reineke/indent-blankline.nvim"        , --add dot for space                                         , line for indent and match coloration for brackets
    "nacro90/numb.nvim"                          , --allow to moove to a line like : 60 without to press enter , work also number by number
    "NvChad/nvim-colorizer.lua"                  , -- display the color in many formats (hex                   ,rgb..)
    "simrat39/symbols-outline.nvim"              , -- tag bar like plugin to show tree-function view

    --COLORSCHEME

    -- ("folke/tokyonight.nvim") 
    -- ("rebelot/kanagawa.nvim")
    --  {'nyoom-engineering/oxocrbon.nvim'}
    --[[ 'sainnhe/gruvbox-material', ]]
    { "arturgoms/moonbow.nvim" }                ,


    --[[ ({ ]]
    --[[     'rose-pine/neovim'                  , ]]
    --[[     as = 'rose-pine'                    , ]]
    --[[     config = function() ]]
    --[[         vim.cmd('colorscheme rose-pine') ]]
    --[[     end ]]
    --[[ }) ]]
    --[[ { ]]
    --[[     'AlexvZyl/nordic.nvim', ]]
    --[[     lazy = false, ]]
    --[[     priority = 1000, ]]
    --[[ }, ]]

    {
        "nvim-tree/nvim-tree.lua"                ,
        tag = 'nightly'
    }                                            ,

    "gelguy/wilder.nvim"                         ,
    --LSP support
     {
        'VonHeikemen/lsp-zero.nvim'              ,
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}            ,
            {'williamboman/mason.nvim'}          ,
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'}                 ,
            {'hrsh7th/cmp-buffer'}               ,
            {'hrsh7th/cmp-path'}                 ,
            {'saadparwaiz1/cmp_luasnip'}         ,
            {'hrsh7th/cmp-nvim-lsp'}             ,
            {'hrsh7th/cmp-nvim-lua'}             ,

            -- Snippets
            {'L3MON4D3/LuaSnip'}                 ,
            {'rafamadriz/friendly-snippets'}     ,
        }
    }                                            ,
    "jose-elias-alvarez/null-ls.nvim"            ,
    "onsails/lspkind.nvim"                       ,

    --another way to toggle errors
     {
        "folke/trouble.nvim"                     ,
        dependencies = "ryanoasis/vim-devicons"  ,
    }                                            ,

     'folke/lsp-colors.nvim'                     , -- display error with colors 
    "nvim-telescope/telescope.nvim"              , --Telescope

    -- hide the max length column when there is no need
      "m4xshen/smartcolumn.nvim"                 ,


    --TreeSitter
    {
        "nvim-treesitter/nvim-treesitter"        ,
        build = ":TSUpdate"                      ,
    }                                            ,
    "p00f/nvim-ts-rainbow"                       ,
    "windwp/nvim-ts-autotag"                     , -- plugin for treesitter to auto close the html tags
    "nvim-treesitter/nvim-treesitter-context"    , -- always show context of class/functions and more

    "lewis6991/gitsigns.nvim"                    , --GIT

    -- StatusBar
    {"nvim-lualine/lualine.nvim",dependencies = { "ryanoasis/vim-devicons", opt = true },
    }                                            ,
    "akinsho/toggleterm.nvim"                    ,

    -- DEBUGGING WITH DAP
    {"mfussenegger/nvim-dap"},
    {"jay-babu/mason-nvim-dap.nvim"},
    {"nvim-telescope/telescope-dap.nvim"},
    {"theHamsta/nvim-dap-virtual-text"},
    {"rcarriga/nvim-dap-ui"},


    --MINI-PLUGINS
    { 'echasnovski/mini.align', version = false, config = function () require('mini.align').setup() end},
    { 'echasnovski/mini.surround', version = false, config = function () require('mini.surround').setup() end},

    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim"                  ,
        config = function()
            require("chatgpt").setup({
                -- optional configuration
            })
        end                                      ,
        dependencies = {
            "MunifTanjim/nui.nvim"               ,
            "nvim-lua/plenary.nvim"              ,
            "nvim-telescope/telescope.nvim"
        }
    }                                            ,
}
