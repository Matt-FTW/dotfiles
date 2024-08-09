local sql_ft = { "sql", "mysql", "plsql" }
local prefix = "<leader>D"

return {
  { import = "lazyvim.plugins.extras.lang.python" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "jsborjesson/vim-uppercase-sql", ft = sql_ft },
    },
    keys = {
      { prefix .. "a", "<cmd>DBUIAddConnection<cr>", desc = "Add Connection" },
      { prefix .. "u", "<cmd>DBUIToggle<cr>", desc = "Toggle UI" },
      { prefix .. "f", "<cmd>DBUIFindBuffer<cr>", desc = "Find Buffer" },
      { prefix .. "r", "<cmd>DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
      { prefix .. "q", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { prefix, group = "database", icon = " " },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "sqlls",
      },
    },
  },
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
