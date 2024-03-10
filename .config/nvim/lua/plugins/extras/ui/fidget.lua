return {
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
      },
    },
  },
}
