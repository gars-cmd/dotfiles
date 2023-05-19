local colors = {
    fg = "#838994",
    bg = "#e4d794",
}


--[[ local colors_n = require 'nordic.colors' ]]


local theme = {
	normal = {
		a  = { fg = colors.fg, bg = colors.bg },
		b  = { fg = colors.fg, bg  = colors.bg },
		c  = { fg = colors.fg, bg = colors.bg },
		--[[ z  = { fg = colors.fg, bg = colors.bg }, ]]
	},

    inactive = {
		a  = { fg = colors.fg, bg = colors.bg },
		b  = { fg = colors.fg, bg  = colors.bg },
		c  = { fg = colors.fg, bg = colors.bg },
		--[[ z  = { fg = colors.fg, bg = colors.bg }, ]]
    },

	insert  = { a = { fg = colors.fg, bg = colors.bg } },
	visual  = { a = { fg = colors.fg, bg = colors.bg } },
	replace = { a = { fg = colors.fg, bg = colors.bg } },
}
local vim_icons = {
	function()
		return " "
	end,
	--[[ separator = { left = "", right = "" }, ]]
	color = { bg = colors.bg, fg = colors.fg },
}

local space = {
	function()
		return " "
	end,
	color = { bg =colors.bg, fg = colors.fg},
}

local filename = {
	'filename',
	color = { bg = colors.bg, fg = colors.fg },
	--[[ separator = { left = "", right = "" }, ]]
}

local filetype = {
	"filetype",
	icon_only = true,
	colored   = true,
	color     = { bg   = colors.bg },
	--[[ separator = { left = "", right = "" }, ]]
}

local filetype_tab = {
	"filetype",
	icon_only = true,
	colored   = true,
	color     = { bg = colors.bg},
}


local position = {
	'fileformat',
    symbols = {
        unix = '',
    },
    color     = { bg   = colors.bg, fg = colors.fg },
	--[[ separator = { left = "", right        = "" }, ]]
}

local location = {
    'location',
	color     = { bg   = colors.bg, fg = colors.fg },
	--[[ separator = { left = "", right      = "" }, ]]
}

local encoding = {
	'encoding',
	color     = { bg   = colors.bg, fg = colors.fg},
	--[[ separator = { left = "", right      = "" }, ]]
}

local branch = {
	'branch',
	color     = { bg   = colors.bg, fg = colors.fg },
	--[[ separator = { left = "", right             = "" }, ]]
}

local diff = {
	"diff",
	color     = { bg   = colors.bg, fg = colors.fg},
	--[[ separator = { left = "", right      = "" }, ]]
}

local modes = {
	'mode', fmt = function(str) return str:sub(1, 1) end,
	color     = { bg     = colors.bg, fg = colors.fg },
	--[[ separator = {  right = "" }, ]]
}

local function getLspName()
	local msg     = 'No Active Lsp'
	local buf_ft  = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
	'diagnostics',
	color     = { bg   = colors.bg, fg = colors.fg},
	--[[ separator = { left = "", right      = "" }, ]]
}

local lsp = {
	function()
		return getLspName()
	end,
	--[[ separator = { left = ""  }, ]]
	color     = { bg   = colors.bg, fg = colors.fg },
}

require('lualine').setup {

	options = {
		icons_enabled        = true,
		theme                = theme,
		component_separators = { left = '', right = '' },
		section_separators   = { left = '', right = '' },
		disabled_filetypes   = {
            statusline = {},
            winbar     = {},
		},
        ignore_focus         = {},
        always_divide_middle = true,
        globalstatus         = true,
		refresh              = {
			--[[ statusline = 1000, ]]
			--[[ tabline    = 1000, ]]
			--[[ winbar     = 1000, ]]
		}
	},

	sections = {
		lualine_a = {
			--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
			modes,
			--[[ vim_icons, ]]
			--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
		},
		lualine_b = {
			space,

		},
		lualine_c = {
			filename,
			filetype,
			space,
			branch,
			diff,
		},
		lualine_x = {
			space,

		},
		lualine_y = {
			location,
			position,
			space,
		},
		lualine_z = {
			dia,
			lsp,
		}
	},
	inactive_sections = {
		--[[ lualine_a = {}, ]]
		--[[ lualine_b = {}, ]]
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	--[[ tabline = { ]]
	--[[ 	lualine_b = {}, ]]
	--[[ 	lualine_c = {}, ]]
	--[[ 	lualine_y = { ]]
	--[[ 		space, ]]
	--[[ 	}, ]]
	--[[ 	lualine_z = { ]]
	--[[ 	}, ]]
	--[[ }, ]]
	--[[ winbar          = {}, ]]
	--[[ inactive_winbar = {}, ]]

}
