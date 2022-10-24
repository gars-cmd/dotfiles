local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.configs"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require("luasnip.loaders.from_vscode").lazy_load {
  paths = {"~/Documents/autre/web/ng-pokemon-app/angular-snippets/"}
}
