return {
	"Vonr/align.nvim",
	branch = "v2",
	event = "BufRead",
	config = function()
		local NS = { noremap = true, silent = true }

		vim.keymap.set("x", "<leader>ac", function()
			require("align").align_to_char({
				preview = true,
				length = 1,
			})
		end, NS)

		vim.keymap.set("x", "<leader>as", function()
			require("align").align_to_string({
				preview = true,
				regex = true,
			})
		end, NS)
	end,
}

