return {
  "nvim-neotest/neotest",
  dependencies = {
    "rouge8/neotest-rust",
  },
  opts = function(_, opts)
    table.insert(opts.adapters, require("neotest-rust"))
  end,
}
