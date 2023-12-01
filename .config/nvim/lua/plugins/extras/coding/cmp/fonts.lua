return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "amarakon/nvim-cmp-fonts",
  },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "fonts", option = { space_filter = "-" } })
  end,
}
