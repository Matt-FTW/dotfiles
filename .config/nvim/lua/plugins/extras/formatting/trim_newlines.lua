return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft["_"] = opts.formatters_by_ft["_"] or {}
    table.insert(opts.formatters_by_ft["_"], "trim_newlines")
    return opts
  end,
}
