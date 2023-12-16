return {
  "nvim-neo-tree/neo-tree.nvim",
  optional = true,
  dependencies = {
    "luckasRanarison/neo-rename.nvim",
    opts = {},
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      hijack_netrw_behavior = "open_default",
    },
    window = {
      mappings = {
        ["e"] = "open",
      },
    },
  },
}
