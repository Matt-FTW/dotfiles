return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
  },
  opts = function(_, opts)
    table.insert(opts.adapters, require("neotest-vitest"))
  end,
}
