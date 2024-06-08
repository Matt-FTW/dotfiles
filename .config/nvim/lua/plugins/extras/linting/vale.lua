return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "vale",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.markdown = opts.linters_by_ft.markdown or {}
      table.insert(opts.linters_by_ft.markdown, "vale")
      return opts
    end,
  },
}
