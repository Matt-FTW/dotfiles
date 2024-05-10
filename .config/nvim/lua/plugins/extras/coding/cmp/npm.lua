return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "David-Kunz/cmp-npm",
    dependencies = "nvim-lua/plenary.nvim",
    ft = "json",
    opts = {},
  },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "npm", keyword_length = 4 })
  end,
}
