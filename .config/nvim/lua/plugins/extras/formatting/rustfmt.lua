return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.rust = opts.formatters_by_ft.rust or {}
      table.insert(opts.formatters_by_ft.rust, "rustfmt")
      return opts
    end,
  },
}
