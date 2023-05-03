local colors = {
    black       = '#001220',
	red         = '#cc241d',
	grey        = '#504945',
	gray2       = '#0b0e18',
	white       = '#f9f5d7',
	green       = '#6B705C',
	orange      = '#d65d0e',
	light_green = '#b8bb26',
	blue        = '#458588',
    purple      = '#b16286',
}


local palette = require 'nordic.colors'


local theme = {
	normal = {
		a  = { fg = colors.black, bg = palette.blue.base },
		b  = { fg = palette.blue.base, bg  = colors.grey },
		c  = { fg = colors.grey, bg = colors.black },
		z  = { fg = colors.grey, bg = colors.black },
	},

	insert  = { a = { fg = colors.black, bg = palette.red.dim } },
	visual  = { a = { fg = colors.black, bg = palette.green.dim } },
	replace = { a = { fg = colors.black, bg = palette.green.dim } },
}
local vim_icons = {
	function()
		return " "
	end,
	separator = { left = "", right = "" },
	color = { bg = colors.grey, fg = palette.green.dim },
}

local space = {
	function()
		return " "
	end,
	color = { bg = 'NONE', fg = palette.green.dim },
}

local filename = {
	'filename',
	color = { bg = palette.yellow.dim, fg = colors.black },
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
    color     = { bg   = colors.grey, fg = palette.white0 },
	separator = { left = "", right        = "" },
}

local location = {
    'location',
	color     = { bg   = palette.cyan.base, fg = palette.black },
	separator = { left = "", right      = "" },
}

local encoding = {
	'encoding',
	color     = { bg   = colors.grey, fg = palette.blue.base },
	separator = { left = "", right      = "" },
}

local branch = {
	'branch',
	color     = { bg   = palette.green.dim, fg = palette.black },
	separator = { left = "", right             = "" },
}

local diff = {
	"diff",
	color     = { bg   = colors.grey, fg = palette.green.dim },
	separator = { left = "", right      = "" },
}

local modes = {
	'mode', fmt = function(str) return str:sub(1, 1) end,
	color     = { bg     = palette.red.dim, fg = palette.black },
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
	color     = { bg   = colors.grey, fg = palette.blue.base },
	separator = { left = "", right      = "" },
}

local lsp = {
	function()
		return getLspName()
	end,
	separator = { left = ""  },
	color     = { bg   = palette.blue0, fg = palette.white0 },
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
			vim_icons,
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
