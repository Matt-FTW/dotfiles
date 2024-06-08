return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typos",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft["*"] = opts.linters_by_ft["*"] or {}
      table.insert(opts.linters_by_ft["*"], "typos")
      return opts
    end,
  },
}
