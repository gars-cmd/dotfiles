

require 'nordic' .setup {
    telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'classic'
    },
    -- These can contain anything that neovim understands.
    -- (fg, bg, italic, bold, etc.)
    transparent_bg = true,

    syntax = {
        comments = {
            italic = true,
            bold = false
        },
        operators = {
            italic = false,
            bold = true
        },
        keywords = {
            italic = false,
            bold = true
        }
    }
}
vim.cmd.colorscheme 'nordic'
