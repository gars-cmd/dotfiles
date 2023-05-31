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
    "lukas-reineke/indent-blankline.nvim"        , --add dot for space                                         , line for indent and match coloration for brackets
    "nacro90/numb.nvim"                          , --allow to moove to a line like : 60 without to press enter , work also number by number
    "NvChad/nvim-colorizer.lua"                  , -- display the color in many formats (hex                   ,rgb..)
    "simrat39/symbols-outline.nvim"              , -- tag bar like plugin to show tree-function view

    --COLORSCHEME

    { "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ 'rose-pine/neovim', lazy = true, name = 'rose-pine' },
    {'sam4llis/nvim-tundra', lazy = true },
    { 'AlexvZyl/nordic.nvim',
        lazy = true,
        config = function()
            require 'nordic' .load()
    end
    },
    { "catppuccin/nvim" ,lazy = true, name = "catpuccin"},
    { "rebelot/kanagawa.nvim" ,lazy = true},

    {"gelguy/wilder.nvim", lazy = true}                         ,
    --LSP support
     {
        'VonHeikemen/lsp-zero.nvim'              ,
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}            ,
            {'williamboman/mason.nvim'}          ,
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp', lazy = true}                 ,
            {'hrsh7th/cmp-buffer', lazy = true}               ,
            {'hrsh7th/cmp-path', lazy = true}                 ,
            {'saadparwaiz1/cmp_luasnip', lazy = true}         ,
            {'hrsh7th/cmp-nvim-lsp', lazy = true}             ,
            {'hrsh7th/cmp-nvim-lua', lazy = true}             ,

            -- Snippets
            {'L3MON4D3/LuaSnip', lazy = true}                 ,
            {'rafamadriz/friendly-snippets', lazy = true}     ,
        },
        lazy = true,

    }                                            ,
    "jose-elias-alvarez/null-ls.nvim"            ,
    "onsails/lspkind.nvim"                       ,
    "nvim-tree/nvim-web-devicons",
    "dstein64/vim-startuptime",

    --another way to toggle errors
     {
        "folke/trouble.nvim"                     ,
        dependencies = "nvim-tree/nvim-web-devicons"  ,
        lazy = true,
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
    {"windwp/nvim-ts-autotag", lazy = true}                     , -- plugin for treesitter to auto close the html tags
    "nvim-treesitter/nvim-treesitter-context"    , -- always show context of class/functions and more

    "lewis6991/gitsigns.nvim"                    , --GIT

    -- StatusBar
    {"nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons", opts ={ true }}},
    {'ThePrimeagen/harpoon', lazy = true},
    -- DEBUGGING WITH DAP
    {"mfussenegger/nvim-dap", lazy = true},
    {"jay-babu/mason-nvim-dap.nvim", lazy = true},
    {"nvim-telescope/telescope-dap.nvim", lazy = true},
    {"theHamsta/nvim-dap-virtual-text", lazy = true},
    {"rcarriga/nvim-dap-ui", lazy = true},


    --MINI-PLUGINS
    { 'echasnovski/mini.align', lazy = true, version = false, config = function () require('mini.align').setup() end},
    { 'echasnovski/mini.surround',lazy = true, version = false, config = function () require('mini.surround').setup() end},
}
