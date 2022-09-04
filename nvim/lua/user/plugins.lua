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
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
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
	use("JoosepAlviste/nvim-ts-context-commentstring") --support comments for many languages
	use("kyazdani42/nvim-web-devicons") --nice icons/glyphs
	use("lukas-reineke/indent-blankline.nvim") --add dot for space , line for indent and match coloration for brackets
	use("nacro90/numb.nvim") --allow to moove to a line like : 60 without to press enter , work also number by number
	use("NvChad/nvim-colorizer.lua") -- display the color in many formats (hex,rgb..)
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	--colorscheme
	--[[ use("morhetz/gruvbox") ]]
    use { "catppuccin/nvim", as = "catppuccin" }
      

	--cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"kyazdani42/nvim-tree.lua",

		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})
	--snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	--LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use({ -- plugin to toggle diagnostics
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})
	--Telescope
	use("nvim-telescope/telescope.nvim")

	--TreeSitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag") -- plugin for treesitter to auto close the html tags
    use 'nvim-treesitter/nvim-treesitter-context' -- always show context of class/functions and more 

	--GIT
	use("lewis6991/gitsigns.nvim")

	-- StatusBar
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
