return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		local colors = {
			bg = "#191d24",
			fg = "#fbf1c7",
		}

		local space = {
			function()
				return " "
			end,
			color = { bg = colors.bg, fg = colors.fg },
		}

		local filename = {
			"filename",
			color = { bg = colors.bg, fg = colors.fg },
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { bg = colors.bg },
		}

		local position = {
			"fileformat",
			symbols = {
				unix = "",
			},
			color = { bg = colors.bg, fg = colors.fg },
		}

		local location = {
			"location",
			color = { bg = colors.bg, fg = colors.fg },
		}

		local branch = {
			"branch",
			color = { bg = colors.bg, fg = colors.fg },
		}

		local diff = {
			"diff",
			color = { bg = colors.bg, fg = colors.fg },
		}

		local function harpoon_component()
			local mark_idx = require("harpoon.mark").get_current_index()
			local total_marks = require("harpoon.mark").get_length()
			if mark_idx == nil then
				return ""
			end

			return string.format("󱡅  %d/%d", mark_idx, total_marks)
		end

		local function getLspName()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
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
			"diagnostics",
			color = { bg = colors.bg, fg = colors.fg },
		}

		local lsp = {
			function()
				return getLspName()
			end,
			color = { bg = colors.bg, fg = colors.fg },
		}
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",
					-- modes,
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
					{ harpoon_component },
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
				},
			},
			inactive_sections = {
				lualine_c = { "filename" },
				lualine_x = { "location" },
			},
		})
	end,
}
