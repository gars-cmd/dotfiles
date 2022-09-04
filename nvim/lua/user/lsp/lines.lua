-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
  -- virtual_text = false,
})


vim.diagnostic.config({ virtual_lines = true })

vim.keymap.set(
  "",
  "<C-l>",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)
