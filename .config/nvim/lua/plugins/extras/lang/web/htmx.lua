return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        htmx = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "htmx-lsp",
      },
    },
  },
}
