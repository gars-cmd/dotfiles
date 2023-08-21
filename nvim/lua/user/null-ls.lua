local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end



null_ls.setup({
  debug = false,
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black,
  },
})

require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = true,
})
