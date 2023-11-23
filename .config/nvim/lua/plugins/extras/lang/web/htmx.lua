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
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "htmx-lsp" })
    end,
  },
}
