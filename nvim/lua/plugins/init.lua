return {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({}) end,},
    { "numToStr/Comment.nvim", config = function() require("Comment").setup() end,},
    "karb94/neoscroll.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "lukas-reineke/indent-blankline.nvim",
    "NvChad/nvim-colorizer.lua",
    { "m4xshen/hardtime.nvim", opts = {} },
    {'MunifTanjim/nui.nvim'},
    {"SmiteshP/nvim-navic", dependencies = "neovim/nvim-lspconfig"},
    {
        "SmiteshP/nvim-navbuddy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
        "numToStr/Comment.nvim",        -- Optional
        "nvim-telescope/telescope.nvim" -- Optional
    }
    },
    --[[ "simrat39/symbols-outline.nvim", ]]
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ 'rose-pine/neovim', lazy = true, name = 'rose-pine' },
    {'sam4llis/nvim-tundra', lazy = true },
    { "EdenEast/nightfox.nvim", lazy = true },
    { "fenetikm/falcon"},
    { 'AlexvZyl/nordic.nvim', lazy = true, config = function() require 'nordic' .load() end },
    { "catppuccin/nvim",lazy = true, name = "catpuccin"},
    { "rebelot/kanagawa.nvim",lazy = true},
    {"gelguy/wilder.nvim", lazy = true},
     { 'VonHeikemen/lsp-zero.nvim', dependencies = {
            {'neovim/nvim-lspconfig',
            dependencies = {
                {
                    "SmiteshP/nvim-navbuddy",
                    dependencies = {
                        "SmiteshP/nvim-navic",
                        "MunifTanjim/nui.nvim"
                    },
                    opts = {lsp = {auto_attach = true } }
                }
            },
        }            ,
            {'williamboman/mason.nvim'}          ,
            {'WhoIsSethDaniel/mason-tool-installer.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/nvim-cmp', lazy = true}                 ,
            {'hrsh7th/cmp-buffer', lazy = true}               ,
            {'hrsh7th/cmp-path', lazy = true}                 ,
            {'saadparwaiz1/cmp_luasnip', lazy = true}         ,
            {'hrsh7th/cmp-nvim-lsp', lazy = true}             ,
            {'hrsh7th/cmp-nvim-lua', lazy = true}             ,
            {'L3MON4D3/LuaSnip', version = '1.2.1' , event = 'VeryLazy' }                 ,
            {'rafamadriz/friendly-snippets', lazy = true}     ,
        }, lazy = true,
    },
    "jose-elias-alvarez/null-ls.nvim",
    "onsails/lspkind.nvim",
    "nvim-tree/nvim-web-devicons",
    "dstein64/vim-startuptime",
    { "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons", lazy = true, },
    'folke/lsp-colors.nvim',
    "nvim-telescope/telescope.nvim",
    {"m4xshen/smartcolumn.nvim", opts = {}},
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "p00f/nvim-ts-rainbow",
    {"windwp/nvim-ts-autotag", lazy = true},
    "nvim-treesitter/nvim-treesitter-context",
    "lewis6991/gitsigns.nvim",
    {"nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons", opts ={ true }}},
    {'ThePrimeagen/harpoon', lazy = true},
    {"mfussenegger/nvim-dap", lazy = true},
    {"jay-babu/mason-nvim-dap.nvim", lazy = true},
    {"nvim-telescope/telescope-dap.nvim", lazy = true},
    {"theHamsta/nvim-dap-virtual-text", lazy = true},
    {"rcarriga/nvim-dap-ui", lazy = true},
    { 'echasnovski/mini.align', lazy = true, version = false, config = function () require('mini.align').setup() end},
    { 'echasnovski/mini.surround',lazy = true, version = false, config = function () require('mini.surround').setup() end},
    { 'svermeulen/text-to-colorscheme.nvim', lazy = true}
}
