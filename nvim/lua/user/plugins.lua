local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use({
        "windwp/nvim-autopairs", --autopair for brackets , guillemet and more
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    use({
        "numToStr/Comment.nvim", --smart way to add comments
        config = function()
            require("Comment").setup()
        end,
    })
    use("karb94/neoscroll.nvim") -- smooth scroll 
    use("JoosepAlviste/nvim-ts-context-commentstring") --support comments for many languages
    use("kyazdani42/nvim-web-devicons") --nice icons/glyphs
    use("lukas-reineke/indent-blankline.nvim") --add dot for space , line for indent and match coloration for brackets
    use("nacro90/numb.nvim") --allow to moove to a line like : 60 without to press enter , work also number by number
    use("NvChad/nvim-colorizer.lua") -- display the color in many formats (hex,rgb..)
    use("simrat39/symbols-outline.nvim") -- tag bar like plugin to show tree-function view

    --COLORSCHEME

    -- use("folke/tokyonight.nvim") 
    -- use("rebelot/kanagawa.nvim")
    -- use {'nyoom-engineering/oxocarbon.nvim'}

    --[[ use({ ]]
    --[[     'rose-pine/neovim', ]]
    --[[     as = 'rose-pine', ]]
    --[[     config = function() ]]
    --[[         vim.cmd('colorscheme rose-pine') ]]
    --[[     end ]]
    --[[ }) ]]
    use 'AlexvZyl/nordic.nvim'

    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        tag = 'nightly'
    })

    use ('gelguy/wilder.nvim')-- fancy command-menu

    --LSP support
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use("jose-elias-alvarez/null-ls.nvim")
    use("onsails/lspkind.nvim")

    --another way to toggle errors
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use 'folke/lsp-colors.nvim' -- display error with colors 
    use("nvim-telescope/telescope.nvim") --Telescope

    -- hide the max length column when there is no need
     use "m4xshen/smartcolumn.nvim"


    --TreeSitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow")
    use("windwp/nvim-ts-autotag") -- plugin for treesitter to auto close the html tags
    use("nvim-treesitter/nvim-treesitter-context") -- always show context of class/functions and more

    use("lewis6991/gitsigns.nvim") --GIT
    use("Vonr/align.nvim") -- align block of text

    -- StatusBar
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use("akinsho/toggleterm.nvim") --toggleTerm
    use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    -- ChatGPT
    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                -- optional configuration
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

