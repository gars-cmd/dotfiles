return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
   config = function ()
        require('neogen').setup({ snippet_engine = "luasnip" })
        vim.keymap.set("n", "<leader>ad", function () require('neogen').generate() end , { silent = true  })
   end,
}

