-- import cmp plugin safely
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end


local icons = require("cmp")

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
vim.cmd('highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6')
vim.cmd('highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6')
vim.cmd('highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0')
vim.cmd('highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0')
vim.cmd('highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE')
vim.cmd('highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4')



cmp.setup({
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select   = true,
	},

	duplicates_default = 0,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion    = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping(function (fallback)
		    if cmp.visible() then
		        cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
		    end
		end,{"i", "s"}), -- previous suggestion
		--[[ ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion ]]
		["<Tab>"] = cmp.mapping(function (fallback)
		    if cmp.visible() then
		        cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
		  end
		end, {"i", "s"}), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<C-o>"] = cmp.mapping.confirm({ select = false }),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	}),
	-- sources for autocompletion
	sources = {
        {
                name = "nvim_lsp",
                max_item_count = 80,
            },
            {
                name = "buffer",
                max_item_count = 20,
                option = {
                    get_bufnrs = function()
                        return vim.tbl_map(function(win)
                            return vim.api.nvim_win_get_buf(win)
                        end, vim.api.nvim_list_wins())
                    end,
                },
            },
    },
	-- configure lspkind for vs-code like icons
	formatting = {
        fields = {"kind", "abbr", "menu"},
		format = function (_, item)
            local kind = item.kind
            item.kind = icons.kind[kind]
            item.menu = kind:gsub("(%1)(%u)", "%1 %2"):lower()
            return item
		end,
	},
})
--FUTUR : for support of SQL completion see https://www.youtube.com/watch?v=_DnmphIwnjo at 16:30
