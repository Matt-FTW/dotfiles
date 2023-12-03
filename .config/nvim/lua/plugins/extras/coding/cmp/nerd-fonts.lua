return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "chrisgrieser/cmp-nerdfont",
  },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "nerdfont" })
  end,
}
