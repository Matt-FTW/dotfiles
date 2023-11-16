return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "pylint" })
    end,
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
