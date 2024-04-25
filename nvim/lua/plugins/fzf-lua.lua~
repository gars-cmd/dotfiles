return {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({})
        local fzf = require("fzf-lua")
        vim.keymap.set("n", "<A-f>", function () require('fzf-lua').files() end , { silent = true ,  })
        vim.keymap.set("n", "<A-g>", function () require('fzf-lua').live_grep() end , { silent = true ,  })
        vim.keymap.set("n", "<A-k>", function () require('fzf-lua').keymaps() end , { silent = true , })
        -- vim.keymap.set("n", "<A-g>", fzf.live_grep(), {})
        -- vim.keymap.set("n", "<A-k>", fzf.keymaps(), {})
        -- vim.keymap.set("n", "<A-s>", fzf.treesitter(), {})
    end,
}

