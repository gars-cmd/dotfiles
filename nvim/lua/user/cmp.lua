-- import cmp plugin safely
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

-- import luasnip plugin safely
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end


-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end


require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"


-- Color Settingd 
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#88C0D0" , bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction" , { fg = "#B48EAD" , bg = "NONE" , bold = true })
vim.api.nvim_set_hl(0, "CmpItemKindVariable" , { fg = "#8FBCBB" , bg = "NONE" , bold = true })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword" , { fg = "#D8DEE9" , bg = "NONE" , bold = true })



cmp.setup({
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},

	duplicates_default = 0,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		-- ["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-o>"] = cmp.mapping.confirm({ select = false }),

		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
		-- ["<Tab>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
})
