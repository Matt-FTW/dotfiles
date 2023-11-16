return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "isort" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.python = opts.formatters_by_ft.python or {}
      table.insert(opts.formatters_by_ft.python, "isort")
      return opts
    end,
  },
}
