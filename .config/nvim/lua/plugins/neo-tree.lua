return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    filesystem = {
      hijack_netrw_behavior = "open_default",
    },
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
  },
}
