return {
  { import = "lazyvim.plugins.extras.util.rest" },
  {
    "mistweaverco/kulala.nvim",
    opts = {
      icons = {
        inlay = {
          loading = "󰔟",
          done = " ",
          error = " ",
        },
        lualine = " ",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kulala_ls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.http = opts.formatters_by_ft.http or {}
      table.insert(opts.formatters_by_ft.python, "kulala")
      return opts
    end,
  },
}
