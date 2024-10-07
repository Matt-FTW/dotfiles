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
}
