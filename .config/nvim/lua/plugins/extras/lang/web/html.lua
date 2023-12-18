return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "html",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {},
        html = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "emmet-language-server", "html-lsp" })
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "html",
    },
  },
}
