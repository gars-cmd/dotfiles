local colors = {
    black       = '#001220',
	red         = '#b4637a',
	grey        = '#dfdad9',
	gray2       = '#26233a',
	white       = '#e0def4',
	green       = '#31748f',
	orange      = '#ea9d34',
	blue        = '#9ccfd8',
    purple      = '#c4a7e7',
}


local colors_n = require 'nordic.colors'


local theme = {
	normal = {
		a  = { fg = colors.black, bg = colors.blue },
		b  = { fg = colors.blue, bg  = colors.grey },
		c  = { fg = colors.grey, bg = colors.black },
		z  = { fg = colors.grey, bg = colors.black },
	},

	insert  = { a = { fg = colors.black, bg = colors.red } },
	visual  = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.green } },
}
local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.grey, fg = colors.green },
}

local space = {
	function()
		return " "
	end,
	color = { bg = 'NONE', fg = colors.green},
}

local filename = {
	'filename',
	color = { bg = colors.orange, fg = colors.black },
	separator = { left = "", right = "" },
}

local filetype = {
	"filetype",
	icon_only = true,
	colored   = true,
	color     = { bg   = colors.grey },
	separator = { left = "", right = "" },
}

local filetype_tab = {
	"filetype",
	icon_only = true,
	colored   = true,
	color     = { bg = colors.grey },
}


local position = {
	'fileformat',
    symbols = {
        unix = '',
    },
    color     = { bg   = colors.grey, fg = colors.green },
	separator = { left = "", right        = "" },
}

local location = {
    'location',
	color     = { bg   = colors.blue, fg = colors.black },
	separator = { left = "", right      = "" },
}

local encoding = {
	'encoding',
	color     = { bg   = colors.grey, fg = colors.blue},
	separator = { left = "", right      = "" },
}

local branch = {
	'branch',
	color     = { bg   = colors.green, fg = colors.black },
	separator = { left = "", right             = "" },
}

local diff = {
	"diff",
	color     = { bg   = colors.grey, fg = colors.green},
	separator = { left = "", right      = "" },
}

local modes = {
	'mode', fmt = function(str) return str:sub(1, 1) end,
	color     = { bg     = colors.red, fg = colors.black },
	separator = {  right = "" },
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
	color     = { bg   = colors.grey, fg = colors.blue},
	separator = { left = "", right      = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = ""  },
	color     = { bg   = colors.blue, fg = colors.black },
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
			statusline = 1000,
			tabline    = 1000,
			winbar     = 1000,
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
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {
		lualine_b = {
		},
		lualine_c = {},
		lualine_y = {
			space,
		},
		lualine_z = {
		},
	},
	winbar          = {},
	inactive_winbar = {},

}
