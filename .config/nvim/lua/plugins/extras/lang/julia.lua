return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "julia" })
      end
    end,
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
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "julia-lsp" })
    end,
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
    ensure_installed = {
      "julia",
    },
  },
}
