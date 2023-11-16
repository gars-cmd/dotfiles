_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_chunks',
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath('cache')..'/luacache_modpaths',
  }
}

require "user.autorun"
require "user.options"
require "user.null-ls"
require "user.keymaps"
require "user.plugins"
require "user.cmp"
require "user.harpoon"
require "user.mason-config"
require "user.lsp-zero"
require "user.colorscheme"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.lualine"
--[[ require "user.indent" ]]
require "user.colorizer"
require "user.ts-autotag"
require "user.treesitter-context"
require "user.wilder"
require "user.navbuddy"
require "user.luasnip"
