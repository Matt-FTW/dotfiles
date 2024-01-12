return {
  { import = "lazyvim.plugins.extras.lang.python" },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.python = opts.formatters_by_ft.python or {}
      table.insert(opts.formatters_by_ft.python, "ruff_format")
      return opts
    end,
  },
  {
    "luckasRanarison/nvim-devdocs",
    optional = true,
    ensure_installed = {
      "python-3.11",
    },
  },
}
