return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true,
  dependencies = {
    "luckasRanarison/neo-rename.nvim",
    opts = {},
  },
  opts = {
    window = {
      mappings = {
        ["e"] = "open",
      },
    },
  },
}
