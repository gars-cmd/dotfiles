return {
     "folke/trouble.nvim",
     dependencies = { "nvim-tree/nvim-web-devicons" },
     opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
     },
    config = function ()
        require("trouble").setup{
            signs = {
                  error = "",
                  warning = "",
                  hint = "",
                  information = "",
                  other = "",
            },
        vim.keymap.set("n", "<leader>gt", function() require("trouble").next({skip_groups = true, jump = true}) end)
        }
    end
}
