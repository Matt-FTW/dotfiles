local prefix = "<leader>D"

return {
  { import = "lazyvim.plugins.extras.lang.sql" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqlls = {},
      },
    },
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "sqlite",
        "postgresql-16",
      },
    },
  },
}
