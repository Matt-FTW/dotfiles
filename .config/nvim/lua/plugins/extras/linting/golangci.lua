return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "golangcil-lint" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.go = opts.linters_by_ft.go or {}
      table.insert(opts.linters_by_ft.go, "golangcilint")
      return opts
    end,
  },
}
