return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "julia",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        julials = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "julia-lsp",
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "amarakon/nvim-cmp-lua-latex-symbols",
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "lua-latex-symbols", option = { cache = true } })
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    opts = {
      ensure_installed = {
        "julia",
      },
    },
  },
}
