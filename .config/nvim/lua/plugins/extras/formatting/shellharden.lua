return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "shellharden" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.bash = opts.formatters_by_ft.bash or {}
      table.insert(opts.formatters_by_ft.bash, "shellharden")
      return opts
    end,
  },
}
