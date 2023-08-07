require("mason").setup {
  ui = {
    icons = {
      package_installed = icons.server_installed,
      package_pending = icons.server_pending,
      package_uninstalled = icons.server_uninstalled,
    },
  },
}
