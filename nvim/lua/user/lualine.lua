local present, lualine = pcall(require, "lualine")
if not present then
  return
end

local layout = {
  lualine_a = {
    {
      function()
        return ""
      end,
      separator = { left = "", right = "" },
    },
  },
  lualine_b = {
    {
      "filetype",
      icon_only = true,
      colored = true,
      color = { bg = "", fg = "" },
    },
    {
      "filename",
      color = { bg = "", fg = "StatusLine" },
      separator = { left = "", right = "" },
    },
    {
      "branch",
      icon = "",
      color = { bg = "#c4a7e7", fg = "#001220" },
      separator = { left = "", right = "" },
    },
    {
      "diff",
      colored = true,
      symbols = {
        added = " ",
        modified = " ",
        removed = " ",
      },
      color = { bg = "#001220" },
      separator = { left = "", right = "" },
    },
  },
  lualine_c = {
    {
      function()
        return ""
      end,
      color = { bg = "#31748f", fg = "#121319" },
      separator = { left = "", right = "" },
    },
    {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = {
        "info",
        "error",
        "warn",
        "hint",
      },
      diagnostic_color = {
        error = { fg = "#eb6f92", bg = "#0f111a" },
        warn = { fg = "DiagnosticWarn", bg = "#0f111a" },
        info = { fg = "DiaganosticInfo", bg = "#0f111a" },
        hint = { fg = "#9ccfd8", bg = "#0f111a" },
      },
      colored = true,
      update_in_insert = true,
      always_visible = false,
      symbols = {
        error = " ",
        warn = " ",
        hint = " ",
        info = " ",
      },
      separator = { left = "", right = "" },
    },
  },
  lualine_x = {},
  lualine_y = {},
  lualine_z = {
    {
      "filesize",
      color = "StatusLine",
      separator = { left = "", right = "" },
    },
    {
      function()
        return ""
      end,
      separator = { left = "", right = "" },
      color = { bg = "#eb6f92" },
    },
    {
      "progress",
      color = "StatusLine",
    },
    {
      function()
        return ""
      end,
      separator = { left = "", right = "" },
      color = { bg = "#e0def4" },
    },
    {
      "location",
      color = "StatusLine",
    },
    {
      function()
        return ""
      end,
      separator = { left = "", right = "" },
      color = { bg = "#f6c177" },
    },
  },
}

local no_layout = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {},
}

lualine.setup({
  sections = layout,
  inactive_sections = no_layout,
  options = {
    icons_enabled = true,
    globalstatus = false,
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
})
