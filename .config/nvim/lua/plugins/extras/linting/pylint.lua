return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pylint",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.python = opts.linters_by_ft.python or {}
      table.insert(opts.linters_by_ft.python, "pylint")
      return opts
    end,
  },
}
